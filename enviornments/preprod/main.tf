

module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs = var.rgs_parent

}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../modules/azurem_virtual_network"
  vnets = var.vnets_parent
}

module "subnets" {
  depends_on = [module.virtual_network]
  source     = "../../modules/azurem_subnet"
  subnet = var.subnet_parent

}

module "public_ip" {
    depends_on = [ module.resource_group ]
  source = "../../modules/azurem_publicip"
  public_ips = var.public_ips_parent
    
}

module "virtual_machine" {
    depends_on = [ module.subnets, module.public_ip ]
  source = "../../modules/azurem_virtual_machine"
  vms = var.vms_parent
   
}
