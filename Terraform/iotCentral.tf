data "azurerm_resource_group" "rg" {
 
  name = "rg-euwe-di-iotiac"
  
}

resource "azurerm_iotcentral_application" "iotCentral" {
  name                = "cloud-iot-central-tf"
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  sub_domain          = "dabc"

  display_name = "iot-application"
  sku          = "ST2"
  template = "32a80a53-a875-4ffc-b64a-590557aef153@1.0.0"
} 

