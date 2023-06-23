locals {
  name_app = "vtex-integration"
  app_env = {
    DB_HOST                      = aws_db_instance.my_app.address
    DB_NAME                      = var.db_name
    DB_USER                      = var.db_username
    DB_PORT                      = aws_db_instance.my_app.port
    DB_SSL_MODE                  = "true"
    DB_PASSWORD                  = var.db_password
    SITE_URL                     = ""
  }
}