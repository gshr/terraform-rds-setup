module "vpc" {
source  = "terraform-aws-modules/vpc/aws"
version = "3.14.2"
name = "blog-platform-vpc"
cidr = "10.0.0.0/16"
azs  = ["us-east-1a", "us-east-1b", "us-east-1c"]
private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets  = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
enable_nat_gateway   = true
single_nat_gateway   = true
enable_dns_hostnames = true

tags = {
  "name" = "vpc-blog-platform" 
}
  
}