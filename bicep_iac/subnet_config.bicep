targetScope = 'resourceGroup'

resource vnet 'Microsoft.Network/virtualNetworks@2025-07-01' existing = {
  name: 'testvnetxx1'
}
resource nsg 'Microsoft.Network/networkSecurityGroups@2025-07-01' existing = {
  name: 'testnsgxx1'
}

resource routeTable 'Microsoft.Network/routeTables@2025-07-01' existing = {
  name: 'rtxx1'
}


resource subnet 'Microsoft.Network/virtualNetworks/subnets@2025-07-01' = {
  name:'testsubnetxxx1'
  parent:vnet
  properties:{
    addressPrefix:'10.0.0.0/27'
    delegations:[
      {
        name:'Microsoft.Sql.managedInstances'
        properties:{
          serviceName:'Microsoft.Sql/managedInstances'
        }
      }
    ]
    networkSecurityGroup:{
      id:nsg.id
    }
    routeTable:{
      id:routeTable.id
    }
  }
}
output subnetId string = subnet.id
