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
  config_path = "~/.kube/config"  # Replace with the path to your kubeconfig file
  # load_config_file = true
  # version = "~> 2.4"
}