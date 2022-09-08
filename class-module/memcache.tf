

resource "aws_elasticache_cluster" "tf-class-memcache" {
  cluster_id           = "${var.env}-tf-class-memchache"
  engine               = "memcached"
  node_type            = "cache.m4.large"
  num_cache_nodes      = 2
  parameter_group_name = "default.memcached1.6"
  port                 = 11211
  subnet_group_name = aws_elasticache_subnet_group.tf-class-memcache-subnet-group.name


}

resource "aws_elasticache_subnet_group" "tf-class-memcache-subnet-group" {
  name       = "${var.env}-tf-class-memchache-subnet-group"
  subnet_ids = concat([for subnet in aws_subnet.tf-class-data-subnet: subnet.id])
}
