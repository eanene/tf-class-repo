locals {
default_tags = {
        project = "class-project" 
        environment = var.env 
        owner = "devops-team"
    }

data_subnets = { for a, b in aws_subnet.tf-class-data-subnet : a => b }

name_secret_value  = jsondecode(data.aws_secretsmanager_secret_version.db_name_version.secret_string)

password_secret_value  = jsondecode(data.aws_secretsmanager_secret_version.db_password_version.secret_string)

}

# resource "null_resource" "db" {
#   provisioner "local-exec" {
#     when    = create
#     command = "echo ${local.name_secret_value.secret_string} >> test.txt"
#   }
# }