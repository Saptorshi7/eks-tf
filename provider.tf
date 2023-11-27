terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "eu-west-1"
}

provider "kubernetes" {

  # config_path = "~/.kube/config"  # Replace with the path to your kubeconfig file
  # load_config_file = true
  # version = "~> 2.4"

  # host                   = module.eks.endpoint
  # cluster_ca_certificate = module.eks.kubeconfig-certificate-authority-data
  # token                  = var.k8s_token

  

  host                   = module.eks.endpoint
  cluster_ca_certificate = base64decode(module.eks.kubeconfig-certificate-authority-data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", module.eks.endpoint]
    command     = "aws"
  }
}