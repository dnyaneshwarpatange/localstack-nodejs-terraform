terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region     = "ap-south-1"
  access_key = "test"
  secret_key = "test"

  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true

  endpoints {
    lambda = "http://localhost:4566"
    iam    = "http://localhost:4566"
  }
}

resource "aws_iam_role" "lambda_role" {
  name = "localstack-nodejs-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_lambda_function" "node_app" {
  function_name = "localstack-nodejs-demo"
  role          = aws_iam_role.lambda_role.arn
  handler       = "app.handler"
  runtime       = "nodejs22.x"

  filename         = "${path.module}/app.zip"
  source_code_hash = filebase64sha256("${path.module}/app.zip")
}
