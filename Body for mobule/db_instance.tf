resource "aws_db_instance" "default" {
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = "admin"                #If not variable, use " "
  password             = "mysecretPassword"     # Same as above
  skip_final_snapshot = true
}