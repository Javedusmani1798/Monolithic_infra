resource "azurerm_key_vault" "kvs" {
  for_each                    = var.key-vaults
  name                        = each.value.kv-name
  location                    = each.value.location
  resource_group_name         = each.value.rg_name
  enabled_for_disk_encryption = each.value.enabled_for_disk_encryption
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = each.value.soft_delete_retention_days
  purge_protection_enabled    = each.value.purge_protection_enabled
  sku_name                     = each.value.sku_name

  access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Backup",
      "Delete",
      "Get",
      "List",
      "Purge",
      "Recover",
      "Restore",
      "Set"
    ]

    storage_permissions = [
      "Get",
    ]
  }
}
