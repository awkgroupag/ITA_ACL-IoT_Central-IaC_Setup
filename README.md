# Cloud_IoT_IaC
Here, we set up the cloud infrastructure of the Cloud IoT Lab in Bicep and Terraform.

## How to run manually
### Bicep
You will need to install the Azure CLI or Azure Powershell along with Bicep. Following that, navigate to the directory you cloned this repo to within a terminal and authenticate with your Azure account. cd to the Bicep subfolder. Then, run the following (this syntax is for the Azure CLI):
```
az deployment group create --resource-group rg-euwe-di-iotiac --name {enter a deployment name} --template-file iotCentral.bicep --what-if
```
This will show you the changes that deploying the resources as specified in `iotCentral.bicep` would make to any existing resources.

### Terraform
Currently, the terraform state file is stored locally, meaning you will have to generate your own before you can deploy any of these files. This is done by importing all existing resources (currently just the terraform-instance of IoT Central and the resource group containing it), like so: navigate to the directory you cloned the repo to and open a terminal. cd to the Terraform subfolder and run `terraform init`. Next, run 
```
terraform import azurerm_resource_group.rg /subscriptions/35d6c10f-be8b-4d64-8771-7c4d9be0e318/resourceGroups/rg-euwe-di-iotiac
terraform import azurerm_iotcentral_application /subscriptions/35d6c10f-be8b-4d64-8771-7c4d9be0e318/resourceGroups/rg-euwe-di-iotiac/providers/Microsoft.IoTCentral/IoTApps/cloud-iot-central
```
Your Terraform state should now be up to date. To check wether the configuration specified in the terraform files matches the deployed configuration, run `terraform plan`.
