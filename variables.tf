variable "cluster_name" {
  description = "This is cluster name"
  type        = string
}

variable "kubernetes_version" {
  description = "This is cluster version"
  type        = string
}


variable "vpc_cidr" {
  description = "This is vpc cidr"
  type        = string
}

variable "aws_region" {
  description = "This is the value of region"
  type        = string
}