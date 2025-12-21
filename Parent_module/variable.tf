variable "rgs-prod" {}

variable "vnets-prod" {

}

variable "subnets" {

}

variable "nsgs-prod" {

}


variable "nics" {
  type    = any
  default = []
}



variable "vms" {
  description = "Map of VMs to create"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    size                = string
    admin_username      = string
    admin_password      = string
    nic_name            = string
  }))
}



variable "public_ips" {

}

variable "key-vaults" {
  description = "Map of Key Vaults to create"
  type = map(object({
    kv-name                     = string
    location                    = string
    rg_name                     = string
    enabled_for_disk_encryption = bool
    soft_delete_retention_days  = number
    purge_protection_enabled    = bool
    sku_name                    = string
  }))
}

variable "sql_databases" {
  description = "Map of Azure SQL Servers and Databases"
  type = map(object({
    server_name = string
    db_name     = string
    location    = string
    rg_name     = string
    admin_login = string
    admin_pass  = string
    sku_name    = string
    max_size_gb = number
  }))
}


