# Data block to fetch existing NICs dynamically
data "azurerm_network_interface" "nic" {
  for_each = var.vms
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

# Create Linux VM for each VM in map
resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.vms

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password
  disable_password_authentication = false

  network_interface_ids = [    # Code For VM & NIC Attachment
    data.azurerm_network_interface.nic[each.key].id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  provision_vm_agent = true
}
