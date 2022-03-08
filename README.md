# Cloud_IoT_IaC
Here, we set up the cloud infrastructure of the Cloud IoT Lab in Bicep and Terraform.

## Authenticating to Azure
Currently, both scripts are intended to be deployed by a user account (as opposed to a service principal, TODO). As such, once you have cloned the repo, run `az login`, follow the instructions in your browser, and then set the active subscription using `az account set`.

## How to run manually
### Bicep
Navigate to the directory you cloned this repo to within a terminal and authenticate with your Azure account. cd to the Bicep subfolder. Then, run the following (this syntax is for the Azure CLI):
```
az deployment group create --resource-group rg-euwe-di-iotiac --name {enter a deployment name} --template-file iotCentral.bicep --what-if
```
This will show you the changes that deploying the resources as specified in `iotCentral.bicep` would make to any existing resources.

### Terraform
Terraform now uses a remote backend, storing its state data in an Azure storage account. Once you have cloned the repository, you need only cd to the Terraform subdirectory, and then `terraform plan` should give you an overview of the proposed changes.
