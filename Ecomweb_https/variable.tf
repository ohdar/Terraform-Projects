# VPC Variables
variable "region" {
  default       = "ap-south-1"
  description   = "AWS Region"
  type          = string
}

variable "vpc-cidr" {
  default       = "10.0.0.0/16"
  description   = "VPC CIDR Block"
  type          = string
}

variable "public-subnet-1-cidr" {
  default       = "10.0.0.0/24"
  description   = "Public Subnet 1 CIDR Block"
  type          = string
}

variable "public-subnet-2-cidr" {
  default       = "10.0.1.0/24"
  description   = "Public Subnet 2 CIDR Block"
  type          = string
}

variable "private-subnet-1-cidr" {
  default       = "10.0.2.0/24"
  description   = "Private Subnet 1 CIDR Block"
  type          = string
}

variable "private-subnet-2-cidr" {
  default       = "10.0.3.0/24"
  description   = "Private Subnet 2 CIDR Block"
  type          = string
}

variable "private-subnet-3-cidr" {
  default       = "10.0.4.0/24"
  description   = "Private Subnet 3 CIDR Block"
  type          = string
}

variable "private-subnet-4-cidr" {
  default       = "10.0.5.0/24"
  description   = "Private Subnet 4 CIDR Block"
  type          = string
}

variable "ssh-location" {
  default       = "0.0.0.0/0"   #Limit this to your IP Address
  description   = "IP Address That can SSH Into the EC2 Instance"
  type          = string
}

#--------------RDS------------
variable "database-snapshot-identifier" {
  default       = "arn of database" # arn:aws:rds:ap-south-1:7070681992**:snapshot:mysql157db-final-snapshot
  description   = "The Database Snapshot ARN"
  type          = string
}

variable "database-instance-class" {
  default       = "db.t2.micro" 
  description   = "The Database Instance Type"
  type          = string
}

variable "database-instance-identifier" {
  default       = "mysql57db"  # copy from database instance snapshot
  description   = "The Database Instance Identifier"
  type          = string
}

variable "multi-az-deployment" {
  default       = false  
  description   = "Create a Standby DB Instance"
  type          = bool
}

#----------------SNS--------------------
variable "endpoint-email" {
  default       = "awscloudshome@gmail.com"  
  description   = "SNS Topic subscriber emaail"
  type          = string
}

#----------------ALB--------------------
variable "ssl-certificate-arn" {
  default       = "arn"  # arn of registered domain from certificate manager
  description   = "ssl certificate arn"
  type          = string
}