variable "contributorId" {
    type = string
    default = "/subscriptions/35d6c10f-be8b-4d64-8771-7c4d9be0e318/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
}

variable "ownerId" {
    type = string
    default =  "/subscriptions/35d6c10f-be8b-4d64-8771-7c4d9be0e318/providers/Microsoft.Authorization/roleDefinitions/8e3af657-a8ff-443c-a75c-2fe8c4bcb635"
}

variable "principalId" {
    type = string
    default = "7670712e-7d50-452b-a00b-f87736c94ae5"
}

data "azurerm_storage_account" "stateStorage" {
    name = "tfstate1a2b341"
    resource_group_name = "rg-euwe-di-iotiac"
}

resource "azurerm_role_assignment" "terraform_assignment" {
    scope = data.azurerm_storage_account.stateStorage.id
    role_definition_id = var.ownerId
    principal_id = var.principalId
    description = "I used Terraform to assign this role."
}
