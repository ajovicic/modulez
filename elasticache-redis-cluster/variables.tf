variable "Environment" {}

variable "vpc_id" {}
variable "vpc_cidr" {}
variable "dns_zone_id" {}

variable "subnets" {}

variable "engine" {}
variable "engine_version" {}

variable "parameter_group_name" {}

variable "instance_type" {}

# variable "num_cache_nodes" {}

variable "number_cache_clusters" {}

variable "port" {}

variable "maintenance_window" {}

# tags
variable "tags" {
	default = {
	  created_by = "Terraform"
	}
}
