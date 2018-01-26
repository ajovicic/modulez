resource "aws_route53_record" "cache-cluster" {
   zone_id = "${var.dns_zone_id}"
   name = "${var.engine}"
   type = "CNAME"
   ttl = "300"
   records = ["${aws_elasticache_replication_group.cluster-replicated.primary_endpoint_address}"]
}
