variable "key-vaults" {
  description = "Map of Key Vaults"
  type        = map(object({
    kv-name                     = string
    location                    = string
    rg_name                     = string
    enabled_for_disk_encryption = bool
    soft_delete_retention_days  = number
    purge_protection_enabled    = bool
    sku_name                    = string
  }))
}

variable "tenant_id" {
  description = "Azure AD Tenant ID for Key Vault"
  type        = string
}

variable "object_id" {
  description = "Azure AD Object ID for Key Vault access policy"
  type        = string
}
