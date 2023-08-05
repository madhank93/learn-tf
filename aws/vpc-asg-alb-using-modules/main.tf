terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.10.0"
    }
  }
}

module "my_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"

  name = "my-vpc"
  cidr = "10.10.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
  public_subnets  = ["10.10.101.0/24", "10.10.102.0/24", "10.10.103.0/24"]

  single_nat_gateway     = true
  enable_nat_gateway     = true
  one_nat_gateway_per_az = false
  create_igw             = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "my_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "my security group"
  description = "Security group for web server"
  vpc_id      = module.my_vpc.vpc_id

  ingress_cidr_blocks = [module.my_vpc.vpc_cidr_block]
  ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "Opened web server ports"
      cidr_blocks = module.my_vpc.vpc_cidr_block
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "ssh port"
      cidr_blocks = module.my_vpc.vpc_cidr_block
    }
  ]
}

data "aws_ami" "amazon-linux-image" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

module "my_asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "6.10.0"

  name = "my auto scaling group"

  min_size                  = 2
  max_size                  = 4
  desired_capacity          = 2
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  vpc_zone_identifier       = module.my_vpc.private_subnets

  # Launch template
  launch_template_name        = "my-launch-template"
  launch_template_description = "Launch template"
  update_default_version      = true

  image_id          = data.aws_ami.amazon-linux-image.id
  instance_type     = "t3.micro"
  ebs_optimized     = true
  enable_monitoring = false
}