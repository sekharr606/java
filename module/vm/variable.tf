###########Vpc_Variables###########

variable "project_id" {
  description = "The project ID to deploy resources into"
  type        = string
  default     = ""
}
variable "vpc_network_name" {
  type    = string
  default = ""
}
variable "region" {
  description = "The region to deploy resources into"
  type        = string
  default     = ""
}
variable "auto_create_subnetworks" {
  description = "The auto_create_subnetworks"
  type        = string
  default     = ""
}
#############First_Subnetwork_variables###############
variable "first_subnet_name" {
  type    = string
  default = ""
}
variable "first_ip_cidr_range" {
  type    = string
  default = ""
}
################First_Subnetwork_variables###############
variable "second_subnet_name" {
  type    = string
  default = ""
}
variable "second_ip_cidr_range" {
  type    = string
  default = ""
}

############Vm variables##############################

variable "zone" {
  type    = string
  default = ""
}

variable "network_name" {
  description = "The name of the VPC network"
  type        = string
  default     = ""
}

variable "subnet1_cidr" {
  description = "The CIDR block for subnet 1"
  type        = string
  default     = ""
}

variable "subnet2_cidr" {
  description = "The CIDR block for subnet 2"
  type        = string
  default     = ""
}

variable "vm_name" {
  description = "The name of the VM instance"
  type        = string
  default     = ""
}

variable "machine_type" {
  description = "The machine type for the VM instance"
  type        = string
  default     = ""
}
###############Firewall Variables################
variable "firewall_name" {
  description = "The name of the Firewall"
  type        = string
  default     = ""
}
variable "protocol" {
  description = "Protocol of the firewall"
  type        = string
  default     = ""
}
