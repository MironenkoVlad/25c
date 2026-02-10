module "db" {
  source = "./Body for mobule"
  allocated_storage = 10
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t3.micro"
}


output "root_module_db_instance_id" {
    value = module.db.aws_db_instance_id
}

provider "aws" {
  region = "us-east-1"
}