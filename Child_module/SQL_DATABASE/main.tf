resource "azurerm_mssql_server" "sql_server" {
  for_each                     = var.sql_databases
  name                          = each.value.server_name
  resource_group_name           = each.value.rg_name
  location                      = each.value.location
  version                       = "12.0"
  administrator_login           = each.value.admin_login
  administrator_login_password = each.value.admin_pass
}

resource "azurerm_mssql_database" "sql_db" {
  for_each    = var.sql_databases
  name        = each.value.db_name
  server_id  = azurerm_mssql_server.sql_server[each.key].id
  sku_name   = each.value.sku_name
  max_size_gb = each.value.max_size_gb
}
