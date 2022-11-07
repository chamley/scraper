terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}



resource "aws_redshift_cluster" "redshift-prod-cluster" {
  cluster_identifier = "ufc-main"
  database_name      = "dev"
  node_type          = "dc2.large"
  master_username    = var.master_username
  master_password    = var.master_password
}

resource "aws_s3_bucket" "stage-layer-one" {
  bucket = var.stage-layer-one-bucket
}

resource "aws_s3_bucket" "stage-layer-two" {
  bucket = var.stage-layer-two-bucket
}

resource "aws_s3_bucket" "mwaa-bucket" {
  bucket = var.mwaa-dag-bucket
}

resource "aws_s3_bucket" "ufc-config-bucket" {
  bucket = var.ufc-config-files-bucket
}

resource "aws_iam_group" "developers" {
  name = "dev"
}

# resource "aws_iam_role" "iam_role_ufcstats_extractor_lambda" {
#   name               = "ufc-extractor-lambda-role"
#   assume_role_policy = "{}"

# }
# resource "aws_lambda_function" "ufcstats_extractor_lambda" {
#   function_name = "ufc-extractor"
#   role          = aws_iam_role.iam_role_ufcstats_extractor_lambda
# }

# resource "aws_ecr_repository" "ufcstats_ecr_repo" {
#   name = "ufc-images"
# }
