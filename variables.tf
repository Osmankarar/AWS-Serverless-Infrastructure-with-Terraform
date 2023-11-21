variable "region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "lambda_handler" {
  description = "The function entrypoint in your code"
  type        = string
}

variable "lambda_runtime" {
  description = "Runtime language for Lambda"
  type        = string
}
