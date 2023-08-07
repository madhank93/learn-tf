
resource "aws_instance" "lunar" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.lunar-key.key_name
  user_data     = file("install-nginx.sh")
}

resource "aws_eip" "eip" {
  instance = aws_instance.lunar.id
  domain   = "vpc"
  provisioner "local-exec" {
    command = "echo ${aws_eip.eip.public_dns} >> /root/lunar_public_dns.txt"
  }
}

resource "aws_key_pair" "lunar-key" {
  key_name   = "lunar"
  public_key = file("~/.ssh/id_ed25519.pub")
}
