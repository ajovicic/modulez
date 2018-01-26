#
# ElastiCache resources module
#

resource "aws_elasticache_subnet_group" "default-cluster" {
  name = "subnet-group-${var.Environment}-${var.engine}-cluster"
  description = "Private subnets for the ElastiCache instances: ${var.Environment}"
  subnet_ids = ["${split(",", var.subnets)}"]
}

resource "aws_elasticache_replication_group" "cluster-replicated" {
  node_type = "${var.instance_type}"
  port = "${var.port}"
  replication_group_description = "Elasticache Redis cluster replicated"
  replication_group_id = "${var.Environment}-${var.engine}-clu"
  engine = "${var.engine}"
  engine_version = "${var.engine_version}"
  maintenance_window = "${var.maintenance_window}"
  parameter_group_name = "${var.parameter_group_name}"
  automatic_failover_enabled = true
  number_cache_clusters = "${var.number_cache_clusters}"
  subnet_group_name = "${aws_elasticache_subnet_group.default-cluster.name}"
  security_group_ids = ["${aws_security_group.main_cache_access_cluster.id}"]

  tags {
    Name = "tf-${var.Environment}-${var.engine}-ElastiCache-cluster"
    Environment = "${var.Environment}"
    created_by = "${lookup(var.tags,"created_by")}"
    Terraform = "true"
    propagate_at_launch = "true"
  }
}

