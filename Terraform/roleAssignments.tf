# Here, I am referencing the identity that was deployed in Bicep. If it doesn't exist, you have to run the Bicep scripts to deploy it.
data "azurerm_user_assigned_identity" "userManId" {
  name = "user-man-id-demo"    
}


# To remove the role assignment, comment out this block and run "terraform apply" again.
resource "azurerm_role_assignment" "reader" {
  scope                = azurerm_iotcentral_application.iotCentral.id
  role_definition_name = "Reader"
  description          = "This role assignment was created using Terraform."
  principal_id         = data.userManId.principal_id
}

