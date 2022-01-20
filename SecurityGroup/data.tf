data "aws_vpc" "vpc_available" {
  filter {
    name   = "tag:Name"
    values = ["Test VPC"]    
  }
}