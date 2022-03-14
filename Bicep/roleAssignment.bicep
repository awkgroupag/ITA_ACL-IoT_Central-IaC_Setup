
var principalId = '59f7d262-bf65-4551-9ef0-2915ba4f1613'
var readerId = '/providers/Microsoft.Authorization/roleDefinitions/acdd72a7-3385-48ef-bd42-f606fba81ae7'

resource iotCentral 'Microsoft.IoTCentral/iotApps@2021-06-01' existing = {
  name: 'cloud-iot-central-bicep'
}

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  scope: iotCentral
  name: guid(iotCentral.id, principalId, readerId)
  properties: {
    roleDefinitionId: readerId
    principalId: principalId
    principalType: 'ServicePrincipal'
    description: 'I used Bicep to assign this role.'
}
}
output assignmentName string = roleAssignment.name
