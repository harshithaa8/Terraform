variable "region" {
  type        = string
  description = "The AWS region to create resources in"
  default     = "us-east-1"
}

variable "repository_name" {
  type        = string
  description = "The name of the CodeCommit repository"
}

variable "repository_description" {
  type        = string
  description = "The description of the CodeCommit repository"
}

variable "environment" {
  type        = string
  description = "The environment for tagging the repository"
}
