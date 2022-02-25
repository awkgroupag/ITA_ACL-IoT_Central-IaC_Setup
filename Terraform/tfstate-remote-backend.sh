#!/bin/bash

RESOURCE_GROUP_NAME=rg-euwe-di-iotiac
STORAGE_ACOCUNT_NAME=tfstate1a2b341
CONTAINER_NAME=tfstate

#Create storage acc
# az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACOCUNT_NAME --sku Standard_LRS --encryption-services blob

# #Create blob container
# az storage container create --name $CONTAINER_NAME --account_name $STORAGE_ACOCUNT_NAME

ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)
export ARM_ACCESS_KEY=$ACCOUNT_KEY