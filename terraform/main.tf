data "aws_caller_identity" "this" {}

# tfsec:ignore:AWS078
# NOTE: latest 運用
resource "aws_ecr_repository" "lambda" {
  name = local.ecr_image_name

  image_scanning_configuration {
    scan_on_push = true
  }
  encryption_configuration {
    encryption_type = "KMS"
    kms_key         = "alias/aws/ecr"
  }

  lifecycle {
    ignore_changes = [
      encryption_configuration,
    ]
  }

  tags = {
    Name = "${local.ecr_image_name}-image"
  }
}
