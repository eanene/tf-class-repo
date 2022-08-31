resource "aws_rds_cluster" "tf-class-rds-cluster" {
  cluster_identifier = "${var.env}-tf-class-rds-cluster"
  availability_zones = ["us-east-1a", "us-east-1b"]
  database_name      = "tfclassdb"
  master_username    = local.name_secret_value.database_name
  master_password    = local.password_secret_value.database_password
  engine = "aurora-postgresql"
  engine_version = "12.11"
  db_subnet_group_name = aws_db_subnet_group.tf-class-subnet-group.name

  


}


data "aws_secretsmanager_secret" "db-name" {
  name = "tf-class-db-name"
}

data "aws_secretsmanager_secret" "db-password" {
  name = "tf-class-db-password"
}

data "aws_secretsmanager_secret_version" "db_name_version" {
  secret_id = data.aws_secretsmanager_secret.db-name.id
}

data "aws_secretsmanager_secret_version" "db_password_version" {
  secret_id = data.aws_secretsmanager_secret.db-password.id
}

resource "aws_db_subnet_group" "tf-class-subnet-group" {
  # for_each = local.data_subnets
  name       = "${var.env}-tf-class-subnet-group"
  subnet_ids = concat([for subnet in aws_subnet.tf-class-data-subnet: subnet.id])

  tags = merge(
    { Name = "${var.env}-tf-class-subnet-group" },

    local.default_tags
  )
}

resource "aws_rds_cluster_instance" "tf-class-cluster-instances" {
  count              = length(var.tf-class-db-names)
  identifier         = var.tf-class-db-names[count.index]
  cluster_identifier = aws_rds_cluster.tf-class-rds-cluster.id
  instance_class     = "db.r5.large"
  engine             = aws_rds_cluster.tf-class-rds-cluster.engine
  engine_version     = aws_rds_cluster.tf-class-rds-cluster.engine_version
  db_subnet_group_name = aws_db_subnet_group.tf-class-subnet-group.name

  depends_on = [
    aws_rds_cluster.tf-class-rds-cluster
  ]

  
}

