resource "aws_db_subnet_group" "subnet-group" {
  name       = "main"
  subnet_ids =  module.vpc.private_subnets

  tags = {
    Name = "My DB subnet group"
  }
}
resource "aws_db_instance" "mysql-rds" {
  allocated_storage      = 5
  db_name                = "funkymonkey"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  username               = "admin"
  password               = "adminadmin"
  skip_final_snapshot    = true
  backup_retention_period = 7
  publicly_accessible         = false
  db_subnet_group_name =  aws_db_subnet_group.subnet-group.name
  vpc_security_group_ids = [
    aws_security_group.db_sg.id  
  ]


}
