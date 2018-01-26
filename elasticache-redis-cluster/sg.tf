#
# Security group resources
#

resource "aws_security_group" "main_cache_access_cluster" {
  name = "tf-${var.Environment}-elasticache-${var.engine}-cluster"
  description = "Allow access to the Bastion"
  vpc_id = "${var.vpc_id}"

  tags {
    Name = "tf-${var.Environment}-${var.engine}-ElastiCache-cluster-sg"
    Environment = "${var.Environment}"
    created_by = "${lookup(var.tags,"created_by")}"
    Terraform = "true"
    propagate_at_launch = "true"
  }
}

resource "aws_security_group_rule" "allow_cache_access_cluster" {
    type = "ingress"

    from_port = "${var.port}"
    to_port = "${var.port}"
    protocol = "tcp"
    cidr_blocks = ["${var.vpc_cidr}"]

    security_group_id = "${aws_security_group.main_cache_access_cluster.id}"
}

resource "aws_security_group_rule" "allow_all_outbound" {
    type = "egress"

    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.vpc_cidr}"]

    security_group_id = "${aws_security_group.main_cache_access_cluster.id}"
}
