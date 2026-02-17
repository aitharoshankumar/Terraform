variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Project name used for tagging"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnet_cidr_1" {
  description = "CIDR block for public subnet"
  type        = string
}

variable "public_subnet_cidr_2" {
  description = "CIDR block for public subnet"
  type        = string
}

variable "private_subnet_cidr_1" {
  description = "CIDR block for public subnet"
  type        = string
}

variable "private_subnet_cidr_2" {
  description = "CIDR block for private subnet"
  type        = string
}

variable "key_name" {
  type = string
}

variable "instance_type" {
  type = string
}