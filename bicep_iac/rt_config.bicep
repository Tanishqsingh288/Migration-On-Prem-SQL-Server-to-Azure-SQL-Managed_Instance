targetScope = 'resourceGroup'

resource rt 'Microsoft.Network/routeTables@2025-07-01' ={
  name:'rtxx1'
  location:resourceGroup().location
}
