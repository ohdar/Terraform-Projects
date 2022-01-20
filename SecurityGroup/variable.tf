# VPC Variables
variable "region" {
  default     = "ap-south-1"
  description = "AWS Region"
  type        = string
}

variable "ssh-location" {
  default     = "0.0.0.0/0" #Limit this to your IP Address
  description = "IP Address That can SSH Into the EC2 Instance"
  type        = string
}