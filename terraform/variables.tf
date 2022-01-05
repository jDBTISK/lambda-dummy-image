variable "aws_profile" {
  description = "terraform を実行する AWS ユーザーの profile 指定"
  type        = string
  default     = "default"
}

variable "assume_role_arn" {
  description = "terraform 実行時に AssumeRole させたいロールの ARN"
  type        = string
  default     = null
}

locals {
  region = "ap-northeast-1"

  ecr_image_name = "lambda-dummy-image"
  ecr_address    = "${data.aws_caller_identity.this.account_id}.dkr.ecr.${local.region}.amazonaws.com"
}
