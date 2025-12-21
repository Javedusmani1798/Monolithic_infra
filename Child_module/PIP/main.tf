
resource "azurerm_public_ip" "pips" {
  for_each = var.public_ips
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

output "pip_ids" {
  description = "Map of Public IP IDs"
  value       = { for k, v in azurerm_public_ip.pips : k => v.id }
}
