#variables.tf (Root)
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket" #Enter_Here_bucket_name
  type        = string
  default     = "roshantech-bucket"
}
