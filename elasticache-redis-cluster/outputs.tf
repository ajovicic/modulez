output "cache_security_group_id" {
  value = "${aws_security_group.main_cache_access_cluster.id}"
}

output "primary_endpoint_address" {
  value = "${aws_elasticache_replication_group.cluster-replicated.primary_endpoint_address}"
}

output "port" {
  value = "${aws_elasticache_replication_group.cluster-replicated.port}"
}

output "fqdn" {
	value = "${aws_route53_record.cache-cluster.fqdn}"
}
