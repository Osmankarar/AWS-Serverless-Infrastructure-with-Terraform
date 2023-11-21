# AWS-Serverless-Infrastructure-with-Terraform
Project Documentation: AWS Serverless Infrastructure with Terraform
Overview
This project involves the creation of a serverless infrastructure on AWS using Terraform, an Infrastructure as Code (IaC) tool. The setup includes AWS Lambda functions, API Gateway, DynamoDB, and IAM roles and policies, designed to provide a scalable and maintainable serverless architecture.
Objectives
Deploy a serverless application using AWS Lambda.
Manage access and security using IAM roles and policies.
Interface the Lambda function with AWS API Gateway.
Provide a NoSQL database solution using DynamoDB.
Components
1. Terraform
Terraform is used to define and provision the AWS infrastructure using a declarative configuration language known as HashiCorp Configuration Language (HCL).
Key Files
providers.tf: Defines the AWS provider and region.
variables.tf: Declares variables for configuration.
lambda.tf: Contains the AWS Lambda function and related IAM roles.
api_gateway.tf: Sets up the API Gateway resources.
dynamodb.tf: Configures the DynamoDB instance.
main.tf: The entry point for Terraform configurations.
2. AWS Lambda
AWS Lambda is a serverless compute service that runs code in response to events and automatically manages the underlying compute resources.
Configuration: Defined in lambda.tf.
Role: Executes code in response to HTTP requests made via the API Gateway.
Runtime: Node.js 18.x.
3. Amazon API Gateway
Amazon API Gateway is a fully managed service that makes it easy for developers to create, publish, maintain, monitor, and secure APIs at any scale.
Configuration: Defined in api_gateway.tf.
Role: Acts as a front door for the Lambda function to enable an HTTP endpoint.
4. Amazon DynamoDB
Amazon DynamoDB is a key-value and document database that delivers single-digit millisecond performance at any scale.
Configuration: Managed in dynamodb.tf.
Role: Provides a NoSQL database solution for the serverless architecture.
5. AWS IAM (Identity and Access Management)
IAM is used to securely control individual and group access to AWS resources.
Configuration: Included in lambda.tf for Lambda execution role.
Role: Ensures secure and restricted access to AWS resources.
Deployment Steps
AWS Configuration: Use AWS CLI to configure AWS credentials.
Terraform Initialization: Run terraform init to initialize the working directory.
Execution Plan: Run terraform plan to review the changes that will be made.
Apply Changes: Execute terraform apply to apply the changes to AWS.
Troubleshooting
Lambda Runtime Issue: Ensure the runtime for Lambda is set to a version supported by AWS (e.g., nodejs18.x).
IAM Role Permissions: Verify IAM roles have correct permissions for Lambda execution, API Gateway access, and DynamoDB operations.
Terraform State Lock: Check for any locks on Terraform state in case of errors during apply.
Conclusion
This project demonstrates the efficiency and effectiveness of using Terraform for deploying serverless architectures on AWS. It leverages the power of AWS Lambda, API Gateway, and DynamoDB to create a scalable and robust serverless application while maintaining security and accessibility through IAM.
 

