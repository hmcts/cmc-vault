variable "product" {
  type                  = "string"
  default               = "cmc"
}

variable "env" {
  type                  = "string"
}

variable "resource_group_name" {
  type                  = "string"
  default               = "cmc-vault"
  description           = "(Required) The resource group to deploy your vault to"
}

variable "location" {
  type                  = "string"
  default               = "UK South"
  description           = "(Required) The location of the resource group"
}

variable "tenant_id" {
  type                  = "string"
  description           = "(Required) The Azure Active Directory tenant ID that should be used for authenticating requests to the key vault. This is usually sourced from environemnt variables and not normally required to be specified."
}

variable "client_id" {
  type                  = "string"
  description           = "(Required) The object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies. This is usually sourced from environemnt variables and not normally required to be specified."
}
