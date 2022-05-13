resource iotCentral 'Microsoft.IoTCentral/iotApps@2021-06-01' existing = {
  name: 'cloud-iot-central-bicep'
}
param location string = resourceGroup().location


// This is the principal ID of the user-assigned managed identity we'll assign new roles to.


// The last bit starting with b249... in the RoleDefinitionResourceId specifies the built-in role of "Contributor". You have to look up these IDs in the Microsoft
// Docs every time you want to assign a built-in role, and provide a fully qualified id containing the subscription id...
param subscriptionId string = '35d6c10f-be8b-4d64-8771-7c4d9be0e318'
param roleDefinitionResourceId string =  '/subscriptions/${subscriptionId}/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'

resource userManId 'Microsoft.ManagedIdentity/userAssignedIdentities@2021-09-30-preview' = {
  name: 'user-man-id-demo'
  location: location
}


resource roleAssignment 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  scope: iotCentral
  name: guid(iotCentral.id, userManId.name, roleDefinitionResourceId)
  properties: {
    roleDefinitionId: roleDefinitionResourceId
    principalId: userManId.properties.principalId
    principalType: 'ServicePrincipal'
  }
}
