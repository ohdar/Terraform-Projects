# Create Database Subnet Group
# terraform aws db subnet group

resource "aws_db_subnet_group" "db_sub_group" {
  name        = "database main"
  subnet_ids  = [aws_subnet.private-subnet-3.id, aws_subnet.private-subnet-4.id]
  description = "Subnets for Database Instance"

  tags = {
    Name = "Subnets for Database Instance"
  }
}

# Create Database Instance 
# terraform aws db instance

resource "aws_db_instance" "db_instance" {
  engine                   = var.engine_name
  name                     = var.db_name
  username                 = var.user_name
  password                 = var.pass
  skip_final_snapshot      = var.skip_finalSnapshot
  db_subnet_group_name     = aws_db_subnet_group.db_sub_group.id
  delete_automated_backups = var.delete_automated_backup
  multi_az                 = var.multi_az_deployment
  publicly_accessible      = var.public_access
  vpc_security_group_ids   = [aws_security_group.database-security-group.id]
  instance_class           = var.instance_class
  allocated_storage        = 20

  tags = {
    name = "Demo MySQL RDS Instance"
  }
}


output "subnet_data" {
  value = aws_db_subnet_group.db_sub_group.id
}
output "rds_address" {
  value = aws_db_instance.db_instance.address
}


#-------------------------------


