provider "aws" {
  region = var.region
  access_key = "AKIAV7WF7N45FH4CAHF5"
  secret_key = "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"
}

# IAM policy definition
resource "aws_iam_policy" "lambda_apigateway_policy" {
  name        = "lambda-apigateway-policy-grp3"
  description = "Policy that allows Lambda functions to access DynamoDB and CloudWatch Logs"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid    = "Stmt1428341300017",
        Action = [
          "dynamodb:DeleteItem",
          "dynamodb:GetItem",
          "dynamodb:PutItem",
          "dynamodb:Query",
          "dynamodb:Scan",
          "dynamodb:UpdateItem"
        ],
        Effect   = "Allow",
        Resource = "*"
      },
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}

# IAM role definition
resource "aws_iam_role" "lambda_apigateway_role" {
  name = "lambda-apigateway-role-grp3"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        },
      },
    ]
  })
}

# Attach the IAM policy to the IAM role
resource "aws_iam_role_policy_attachment" "lambda_apigateway_policy_attachment" {
  role       = aws_iam_role.lambda_apigateway_role.name
  policy_arn = aws_iam_policy.lambda_apigateway_policy.arn
}

resource "aws_dynamodb_table" "lambda-apigateway" {
  name           = "lambda-apigateway"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "Id"

  attribute {
    name = "Id"
    type = "S"
  }
}
