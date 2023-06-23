resource "aws_db_instance" "this" {
  allocated_storage       = 5
  storage_type            = "gp2"
  engine                  = "postgres"
  engine_version          = "12.3"
  instance_class          = "db.t2.micro"
  name                    = var.db_name
  username                = var.db_username
  password                = var.db_password
  parameter_group_name    = "default.postgres12"
  backup_retention_period = 0
}