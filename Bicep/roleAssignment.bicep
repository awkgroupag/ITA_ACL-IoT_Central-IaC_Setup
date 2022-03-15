
var principalId = '7670712e-7d50-452b-a00b-f87736c94ae5'
var readerId = '/providers/Microsoft.Authorization/roleDefinitions/acdd72a7-3385-48ef-bd42-f606fba81ae7'

resource stateStorage 'Microsoft.Storage/storageAccounts@2021-08-01' existing = {
  name: 'tfstate1a2b341'
}

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = {
  scope: stateStorage
  name: guid(stateStorage.id, principalId, readerId)
  properties: {
    roleDefinitionId: readerId
    principalId: principalId
    principalType: 'ServicePrincipal'
    description: 'I used Bicep to assign this role.'
}
}
output assignmentName string = roleAssignment.name
