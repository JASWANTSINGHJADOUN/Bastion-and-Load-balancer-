module "rg" {
  source   = "../modules/RG"
  name     = var.name
  location = var.location
}

module "vnet" {
  source              = "../modules/Vnet"
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = module.rg.rg_name
}

module "subnet" {
  source               = "../modules/Subnet"
  name                 = var.subnet_name
  resource_group_name  = module.rg.rg_name
  virtual_network_name = module.vnet.vnet_name
  address_prefixes     = var.subnet_prefix
}

module "vm" {
  source                = "../modules/VM"
  name                  = var.vm1_name
  location              = var.location
  resource_group_name   = module.rg.rg_name
  network_interface_ids = ["<nic-id>"]
  vm_size               = var.vm_size
  nic_name              = var.nic1_name
  subnet_id             = module.subnet.subnet_id
}

module "vm2" {
  source                = "../modules/VM"
  name                  = var.vm2_name
  location              = var.location
  resource_group_name   = module.rg.rg_name
  network_interface_ids = ["<nic2-id>"]
  vm_size               = var.vm_size
  nic_name              = var.nic2_name
  subnet_id             = module.subnet.subnet_id
}


resource "azurerm_public_ip" "lb_public_ip" {
  name                = var.lb_public_ip_name
  location            = var.location
  resource_group_name = module.rg.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

module "loadbalancer" {
  source              = "../modules/LoadBalancer"
  lb_name             = var.lb_name
  location            = var.location
  resource_group_name = module.rg.rg_name
  public_ip_id        = azurerm_public_ip.lb_public_ip.id
  public_ip_name      = var.lb_public_ip_name
}

module "bastion_subnet" {
  source               = "../modules/Subnet"
  name                 = var.bastion_subnet_name
  resource_group_name  = module.rg.rg_name
  virtual_network_name = module.vnet.vnet_name
  address_prefixes     = var.bastion_subnet_prefix
}

module "bastion" {
  source               = "../modules/Bastion"
  bastion_name         = var.bastion_name
  location             = var.location
  resource_group_name  = module.rg.rg_name
  virtual_network_name = module.vnet.vnet_name
  address_prefixes     = var.bastion_subnet_prefix
  public_ip_name       = var.bastion_public_ip_name
}

