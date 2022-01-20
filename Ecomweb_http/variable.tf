# VPC Variables
variable "region" {
  default     = "ap-south-1"
  description = "AWS Region"
  type        = string
}

variable "vpc-cidr" {
  default     = "10.0.0.0/16"
  description = "VPC CIDR Block"
  type        = string
}

variable "public-subnet-1-cidr" {
  default     = "10.0.0.0/24"
  description = "Public Subnet 1 CIDR Block"
  type        = string
}

variable "public-subnet-2-cidr" {
  default     = "10.0.1.0/24"
  description = "Public Subnet 2 CIDR Block"
  type        = string
}

variable "private-subnet-1-cidr" {
  default     = "10.0.2.0/24"
  description = "Private Subnet 1 CIDR Block"
  type        = string
}

variable "private-subnet-2-cidr" {
  default     = "10.0.3.0/24"
  description = "Private Subnet 2 CIDR Block"
  type        = string
}

variable "private-subnet-3-cidr" {
  default     = "10.0.4.0/24"
  description = "Private Subnet 3 CIDR Block"
  type        = string
}

variable "private-subnet-4-cidr" {
  default     = "10.0.5.0/24"
  description = "Private Subnet 4 CIDR Block"
  type        = string
}

variable "ssh-location" {
  default     = "0.0.0.0/0" #Limit this to your IP Address
  description = "IP Address That can SSH Into the EC2 Instance"
  type        = string
}


#-----------------RDS Instance--------------------

variable "engine_name" {
  default     = "mysql"
  description = "Enter the DB engine"
  type        = string
}

variable "db_name" {
  default     = "rdsdemodb"
  description = "Enter the name of the database to be created inside DB Instance"
  type        = string
}
variable "user_name" {
  default     = "demouser"
  description = "Enter the username for DB"
  type        = string
}
variable "pass" {
  default     = "rdsdemodb.2021"
  description = "Enter the username for DB"
  type        = string
}
variable "multi_az_deployment" {
  default     = false
  description = "Enable or disable multi-az deployment"
  type        = bool
}

variable "public_access" {
  default     = false
  description = "Whether public access needed"
  type        = bool
}

variable "skip_finalSnapshot" {
  default = true
  type    = bool
}
variable "delete_automated_backup" {
  default = true
  type    = bool
}
variable "instance_class" {
  default = "db.t2.micro"
  type    = string

}

##-----------------------------------------------------------##
# Variable declaration for autoscaling group
##-----------------------------------------------------------##

variable "use_name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}

variable "min_size" {
  description = "Minimum number of instances launched"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Minimum number of instances launched"
  type        = number
  default     = 1
}

variable "desired_capacity" {
  description = "Minimum number of instances launched"
  type        = number
  default     = 1
}