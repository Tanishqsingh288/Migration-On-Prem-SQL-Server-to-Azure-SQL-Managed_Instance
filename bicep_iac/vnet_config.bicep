targetScope= 'resourceGroup'

resource vnet 'Microsoft.Network/virtualNetworks@2025-07-01'={
  name:'testvnetxx1'
  location:resourceGroup().location
  properties:{
    addressSpace:{
      addressPrefixes:[
        '10.0.0.0/16'
      ]
    }
  }
}

output vnetname string =vnet.name
output vnetid string = vnet.id

