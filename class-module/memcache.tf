

resource "aws_elasticache_cluster" "tf-class-memcache" {
  cluster_id           = "${var.env}-tf-class-memchache"
  engine               = "memcached"
  node_type            = "cache.m4.large"
  num_cache_nodes      = 2
  parameter_group_name = "memcached1.4"
  port                 = 11211
  subnet_group_name = aws_elasticache_subnet_group.tf-class-memcache-subnet-group.name
}

resource "aws_elasticache_subnet_group" "tf-class-memcache-subnet-group" {
  name       = "${var.env}-tf-class-memchache-subnet-group"
  subnet_ids = concat([for subnet in aws_subnet.tf-class-data-subnet: subnet.id])
}

# resource "aws_elasticache_parameter_group" "tf-class-paramater-group" {
#   name   = "cache-params"
#   family = "memcached1.4"

#   parameter {
#     name  = "activerehashing"
#     value = "yes"
#   }

#   parameter {
#     name  = "min-slaves-to-write"
#     value = "2"
#   }
# }