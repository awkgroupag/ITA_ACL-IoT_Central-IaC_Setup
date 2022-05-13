# Cloud_IoT_IaC
Here, we set up the cloud infrastructure of the Cloud IoT Lab in Bicep and Terraform. This is now mostly intended for demo/tryout purposes. You'll have to install the Azure CLI, Bicep, and Terraform.

## Authenticating to Azure
Currently, both scripts are intended to be deployed by a user account (as opposed to a service principal, TODO). As such, once you have cloned the repo, run `az login`, follow the instructions in your browser, and then set the active subscription using `az account set` to `subs-te-di-acl_sandbox`.

## How to use this Demo
Clone the repo and navigate to the resource group `rg-euwe-di-iotiac` in the Azure portal to see what you're deploying. These sample files deploy an instance of IoT Central, an user-assigned managed identity, and some role assignments. You can delete each of these resources if you want a fresh start (perhaps somebody didn't clean up 
the last time they used this demo), **but do NOT delete the storage account tfstate1a2b341!!!**. It contains the terraform state file.

You can experiment with the role assignments and comment/uncomment them and redeploy to see what happens - e.g., terraform will remove the assignment if you comment it out and bicep won't. Another example: comment out "description" and redeploy, then terraform will notify you that this requires the entire role assignment to be deleted and recreated (i.e. this change is not realizable as a modification of the existing assignment).

## Framework specifics
### Bicep
Navigate to the directory you cloned this repo to within a terminal and authenticate with your Azure account. cd to the Bicep subfolder. Then you can run any of the two bicep files using
```
az deployment group create --resource-group rg-euwe-di-iotiac --name {enter a deployment name} --template-file {filename} --what-if
```
This will show you the changes that deploying the resources as specified in `iotCentral.bicep` would make to any existing resources. Remove `--what-if` if you want to deploy. You'll have to deploy iotCentral.bicep first.

### Terraform
Terraform now uses a remote backend, storing its state data in an Azure storage account. Once you have cloned the repository, you need only cd to the Terraform subdirectory, and then initialize it using `terraform init`. You can run `terraform plan` right after to get the proposed changes. **For Role assignments:** The identity which is assigned role assignments is specified in one of the bicep files, so you'll have to deploy these first. You can also download the state file from the storage account (storage acc/containers/tfstate/terraform.tfstate on the side menu on the left, then click "download" in the top bar) to see what the state file looks like and why you shouldnt' put it on GitHub (there's access keys in it).
![image](https://user-images.githubusercontent.com/70448074/168275387-7351742d-af8e-4615-a0db-a1730a3a8901.png)

