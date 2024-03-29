
/*
 * Create IAM user for Serverless framework to use to deploy the lambda function
 */
module "serverless-user" {
  source  = "silinternational/serverless-user/aws"
  version = "0.1.3"

  app_name   = "cloudflare-scanner"
  aws_region = var.aws_region
}
