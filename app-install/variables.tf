variable "ibmcloud_api_key" {
  description = "The IBM Cloud platform API key needed to deploy IAM enabled resources."
  type        = string
  sensitive   = true
}

variable "region" {
  description = "IBM Cloud region where the resources will be created."
  type        = string
}

variable "ssh_private_key" {
  description = "Private SSH key (RSA format) that is paired with the public ssh key."
  type        = string
  sensitive   = true
}

variable "floating_ip_address" {
  description = "The floating point IP address of the jump box."
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC to get list of VSIs"
  type        = string
}

variable "number_vsi_workload" {
  description = "Number of workload VSIs"
  type        = number
  default     = 3
}

