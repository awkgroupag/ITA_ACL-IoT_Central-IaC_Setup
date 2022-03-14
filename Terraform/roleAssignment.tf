variable "contributorId" {
    type = string
    default = "/subscriptions/35d6c10f-be8b-4d64-8771-7c4d9be0e318/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
}

variable "principalId" {
    type = string
    default = "59f7d262-bf65-4551-9ef0-2915ba4f1613"
}

resource "azurerm_role_assignment" "terraform_assignment" {
    scope = azurerm_iotcentral_application.iotCentral.id
    role_definition_id = var.contributorId
    principal_id = var.principalId
    description = "I used Terraform to assign this role."
}
