provider "aws" {
  access_key = "AKIA57JWR637Z6CJNJIA"
  secret_key = "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"
  region     = var.aws_region
  #if you are running from AWS ec2 linux instance please use bellow credentials section
  #shared_credentials_file = "$HOME/.aws/credentials"
  #profile = "default"
}
