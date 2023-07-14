variable "ssh_private_key" {
  description = "Private SSH key (RSA format) that is paired with the public ssh key."  
  type        = string
  sensitive   = true
}

variable "workload_vsi_list" {
  description = "The id of the VPC where the virtual server is to be created."
  type = list
}

variable "floating_ip_address" {
  description = "The floating point IP address of the jump box."
  type = string
}
