resource "aws_api_gateway_rest_api" "example_api" {
  name        = "example-api"
  description = "Example API Gateway for triggering Lambda"
}

resource "aws_api_gateway_resource" "example_resource" {
  rest_api_id = aws_api_gateway_rest_api.example_api.id
  parent_id   = aws_api_gateway_rest_api.example_api.root_resource_id
  path_part   = "example-path"
}

resource "aws_api_gateway_method" "example_method" {
  rest_api_id   = aws_api_gateway_rest_api.example_api.id
  resource_id   = aws_api_gateway_resource.example_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "example_integration" {
  rest_api_id = aws_api_gateway_rest_api.example_api.id
  resource_id = aws_api_gateway_resource.example_resource.id
  http_method = aws_api_gateway_method.example_method.http_method
  integration_http_method = "POST" # Lambda functions are invoked via POST
  type        = "AWS_PROXY"
  uri         = aws_lambda_function.example.invoke_arn
}

resource "aws_api_gateway_deployment" "example_deployment" {
  depends_on = [
    aws_api_gateway_integration.example_integration
  ]
  
  rest_api_id = aws_api_gateway_rest_api.example_api.id
  stage_name  = "v1"
}

output "invoke_url" {
  value = "${aws_api_gateway_deployment.example_deployment.invoke_url}"
}
