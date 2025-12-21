rgs-prod = {
  rg1 = {
    name     = "rg-infra"
    location = "centralindia"
  }
}


vnets-prod = {

  vnet1 = {
    name                = "vnet-infra"
    location            = "centralindia"
    resource_group_name = "rg-infra"
    address_space       = ["10.0.0.0/16"]

  }
}

subnets = {
  sub1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "rg-infra"
    virtual_network_name = "vnet-infra"
    address_prefixes     = ["10.0.1.0/24"]
  }

  sub2 = {
    name                 = "backend-subnet"
    resource_group_name  = "rg-infra"
    virtual_network_name = "vnet-infra"
    address_prefixes     = ["10.0.2.0/24"]
  }
}



nsgs-prod = {
  nsg1 = {

    name                = "frontend-nsg"
    location            = "centralindia"
    resource_group_name = "rg-infra"


  }


  nsg2 = {
    name                = "backend-nsg"
    location            = "centralindia"
    resource_group_name = "rg-infra"

  }
}



vms = {
  vm1 = {
    name                = "frontend-vm"
    location            = "centralindia"
    resource_group_name = "rg-infra"
    size                = "Standard_F2"
    admin_username      = "webvm1"
    admin_password      = "Password@1234"
    nic_name            = "frontend-nic" # 👈 ye missing tha
  }

  vm2 = {
    name                = "backend-vm"
    location            = "centralindia"
    resource_group_name = "rg-infra"
    size                = "Standard_F2"
    admin_username      = "webvm1"
    admin_password      = "Password@1234"
    nic_name            = "backend-nic" # 👈 ye missing tha
  }
}




public_ips = {
  "pip1" = {
    name                = "frontend-pip"
    location            = "centralindia"
    resource_group_name = "rg-infra"
  }
}



key-vaults = {
  k1 = {
    kv-name                     = "ainfra-keyvault123"
    location                    = "centralindia"
    rg_name                     = "rg-infra"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = true
    sku_name                    = "standard"
  }
}

sql_databases = {
  db1 = {
    server_name = "ainfra-sqlsrv01"
    db_name     = "ainfra-db"
    location    = "centralindia"
    rg_name     = "rg-infra"
    admin_login = "sqladminuser"
    admin_pass  = "P@ssword1234!"
    sku_name    = "Basic"
    max_size_gb = 2
  }
}






