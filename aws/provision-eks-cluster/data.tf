data "aws_availability_zones" "available" {}

data "tls_certificate" "eks" {
  url = module.eks.cluster_oidc_issuer_url
}