# Security Group for Internet Access
resource "aws_security_group" "internet_sg" {
  name        = "internet-sg"
  description = "Security group for internet access"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   egress {
    from_port   = 0 
    to_port     = 0 
    protocol    = "-1" 
    cidr_blocks = ["0.0.0.0/0"] 
   }
    vpc_id      = module.vpc.vpc_id

}

resource "aws_security_group" "db_sg" {
  name        = "db-sg"
  description = "Security group for MySQL database access"

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.internet_sg.id]

  }
  egress {
    from_port   = 0 
    to_port     = 0 
    protocol    = "-1" 
    cidr_blocks = ["0.0.0.0/0"] 
   }
    vpc_id      = module.vpc.vpc_id

}

output "internet_sg_id" {
  value = aws_security_group.internet_sg.id
}

output "db_sg_id" {
  value = aws_security_group.db_sg.id
}
