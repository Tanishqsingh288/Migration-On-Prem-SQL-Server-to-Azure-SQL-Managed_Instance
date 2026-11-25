targetScope = 'resourceGroup'

resource nsg 'Microsoft.Network/networkSecurityGroups@2025-07-01' = {
  name:'testnsgxx1'
  location:resourceGroup().location
}
