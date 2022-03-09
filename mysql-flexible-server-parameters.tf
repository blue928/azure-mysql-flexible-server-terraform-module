# Server Parameters
# The server parameters can be set three ways:
# - Managed with Terraform as we're doing here
# - via the azure command line: https://docs.microsoft.com/en-us/cli/azure/mysql/flexible-server/parameter?view=azure-cli-latest
# - Or through the portal.
# - - Go to portal.azure.com
# - - Find the mysql flexible server in question
# - - click "Server Parameters" on the left. 

resource "azurerm_mysql_flexible_server_configuration" "require_secure_transport" {
  name                = "require_secure_transport"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.fs_db.name
  value               = "OFF"
}

resource "azurerm_mysql_flexible_server_configuration" "audit_log_enabled" {
  name                = "audit_log_enabled"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.fs_db.name
  value               = "ON"
}

resource "azurerm_mysql_flexible_server_configuration" "audit_log_events" {
  name                = "audit_log_events"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.fs_db.name
  value               = "ADMIN,CONNECTION,DCL,DDL,DML,DML_NONSELECT,DML_SELECT,GENERAL,TABLE_ACCESS"
}

resource "azurerm_mysql_flexible_server_configuration" "slow_query_log" {
  name                = "slow_query_log"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.fs_db.name
  value               = "ON"
}