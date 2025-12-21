# Data block per NIC (for_each loop ke andar)
# Ye dynamic data block use hoga har NIC ke liye
resource "azurerm_network_interface" "nic" {
  for_each = var.nics

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "${each.value.name}-ipconfig"
    subnet_id                     = data.azurerm_subnet.nic_subnet[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    public_ip_address_id          = lookup(each.value, "public_ip_id", null)
    
  }

  
}

# Separate data block per NIC
data "azurerm_subnet" "nic_subnet" {
  for_each = var.nics

  name                 = each.value.subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.vnet_name
}

