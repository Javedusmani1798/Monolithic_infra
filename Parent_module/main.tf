module "rg-p" {
  source = "../Child_module/RG"
  rgs    = var.rgs-prod

}

module "vnet-p" {
  source     = "../Child_module/VNET"
  vnets      = var.vnets-prod
  depends_on = [module.rg-p]
}


module "subnet-p" {

  source = "../Child_module/SUBNET"

  subnets = var.subnets

  depends_on = [module.rg-p, module.vnet-p]
}


module "nsg-p" {
  source     = "../Child_module/NSG"
  nsgs       = var.nsgs-prod
  depends_on = [module.rg-p]

}



module "nic-p" {
  source = "../Child_module/NIC"

  depends_on = [module.rg-p, module.vnet-p, module.subnet-p]

  nics = {
    nic1 = {
      name                          = "frontend-nic"
      location                      = "centralindia"
      resource_group_name           = "rg-infra"
      vnet_name                     = "vnet-infra"
      subnet_name                   = "sub1"
      private_ip_address_allocation = "Dynamic"
      nsg_id                        = module.nsg-p.nsg_ids["nsg1"]  # Assume NSG module exists
      public_ip_id                  = module.public_ip.pip_ids["pip1"]
    }

    nic2 = {
      name                          = "backend-nic"
      location                      = "centralindia"
      resource_group_name           = "rg-infra"
      vnet_name                     = "vnet-infra"
      subnet_name                   = "sub2"
      private_ip_address_allocation = "Dynamic"
      nsg_id                        = module.nsg-p.nsg_ids["nsg2"]
      # no public IP
    }
  }
}



data "azurerm_client_config" "current" {}

module "key_vault-p" {
  source     = "../Child_module/KEY_VAULT"
  key-vaults = var.key-vaults

  # Pass tenant_id & object_id dynamically
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id

  depends_on = [module.rg-p]
}


module "sql_database_p" {
  source        = "../Child_module/SQL_DATABASE"
  sql_databases = var.sql_databases

  depends_on = [module.rg-p]
}



module "vm-p" {
  source     = "../Child_module/VM"
  vms        = var.vms
  depends_on = [module.rg-p, module.vnet-p, module.subnet-p, module.nic-p]

}



module "public_ip" {
  source     = "../Child_module/PIP"
  public_ips = var.public_ips

  depends_on = [module.rg-p]
}




