param location string = 'westeurope'

resource iotCentral 'Microsoft.IoTCentral/iotApps@2021-06-01' = {
  name: 'cloud-iot-central'
  location: location
  sku: {
    name: 'ST2'
  }
  properties:{
    displayName: 'iot-application'
    subdomain: 'awkgroup'
  }
}
