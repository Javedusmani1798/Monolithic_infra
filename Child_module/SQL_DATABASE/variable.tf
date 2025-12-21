variable "sql_databases" {
  description = "SQL Server and Database configuration"
  type = map(object({
    server_name   = string
    db_name       = string
    location      = string
    rg_name       = string
    admin_login   = string
    admin_pass    = string
    sku_name      = string
    max_size_gb   = number
  }))
}
