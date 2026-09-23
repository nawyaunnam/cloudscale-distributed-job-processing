terraform { required_version = ">= 1.7"; required_providers { aws = {source="hashicorp/aws",version="~> 5.0"} } }
provider "aws" { region = var.region }
variable "region" {type=string;default="us-east-1"}
resource "aws_sqs_queue" "dlq" {name="cloudscale-jobs-dlq";message_retention_seconds=1209600;sqs_managed_sse_enabled=true}
resource "aws_sqs_queue" "jobs" {name="cloudscale-jobs";visibility_timeout_seconds=60;message_retention_seconds=345600;sqs_managed_sse_enabled=true;redrive_policy=jsonencode({deadLetterTargetArn=aws_sqs_queue.dlq.arn,maxReceiveCount=4})}
resource "aws_s3_bucket" "artifacts" {bucket_prefix="cloudscale-artifacts-"}
resource "aws_s3_bucket_versioning" "artifacts" {bucket=aws_s3_bucket.artifacts.id;versioning_configuration{status="Enabled"}}
resource "aws_s3_bucket_server_side_encryption_configuration" "artifacts" {bucket=aws_s3_bucket.artifacts.id;rule{apply_server_side_encryption_by_default{sse_algorithm="AES256"}}}
resource "aws_cloudwatch_log_group" "platform" {name="/cloudscale/platform";retention_in_days=30}

