module "vpc_network" {
  source                  = "/Users/rajasekhar/Desktop/task1/terraform/module/vm"
  vpc_network_name        = var.vpc_network_name
  vm_name                 = var.vm_name
  region                  = var.region
  auto_create_subnetworks = var.auto_create_subnetworks
  project_id              = var.project_id
  first_subnet_name       = var.first_subnet_name
  first_ip_cidr_range     = var.first_ip_cidr_range
  second_subnet_name      = var.second_subnet_name
  second_ip_cidr_range    = var.second_ip_cidr_range
  zone                    = var.zone
  machine_type            = var.machine_type
  firewall_name           = var.firewall_name
  protocol                = var.protocol

}


