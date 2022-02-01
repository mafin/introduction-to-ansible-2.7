variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default = "eu-west-1"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}

variable "INSTANCE_COUNT" {
  default = "2"
}

variable "SERVER-PORT" {
  description = "Default HTTP server port"
  type = number
  default = 80
}