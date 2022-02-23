param location string = 'westeurope'



resource iotCentral 'Microsoft.IoTCentral/iotApps@2021-06-01' = {
  name: 'cloud-iot-central-bicep'
  location: location
  sku: {
    name: 'ST2'
  }
  properties:{
    displayName: 'iot-application-bicep'
    subdomain: 'bacd'
    template: '32a80a53-a875-4ffc-b64a-590557aef153'
  }
}
