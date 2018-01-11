resource "azurerm_resource_group" "vault_resource_group" {
  name     = "${var.resource_group_name}-${var.env}"
  location = "${var.location}"

  tags {
    environment = "${var.env}"
  }
}

module "key-vault" {
  source              = "git@github.com:contino/moj-module-key-vault"
  product             = "${var.product}"
  env                 = "${var.env}"
  resource_group_name = "${azurerm_resource_group.vault_resource_group.name}"
  tenant_id           = "${var.tenant_id}"
  object_id           = "${var.client_id}"

}