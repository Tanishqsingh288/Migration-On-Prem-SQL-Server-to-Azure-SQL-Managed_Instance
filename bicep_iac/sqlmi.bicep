targetScope = 'resourceGroup'

param location string = resourceGroup().location
param name string = 'testmixx2332'
param adminUsername string = 'sqladmin01'
@secure()
param adminPassword string = 'DatabaseMaster#9343839678!Secure'

resource vnet 'Microsoft.Network/virtualNetworks@2025-07-01' existing ={
  name:'testvnetxx1'
}
resource subnet 'Microsoft.Network/virtualNetworks/subnets@2025-07-01' existing = {
  name: 'testvnetxx1/testsubnetxxx1'
}

resource mi 'Microsoft.Sql/managedInstances@2025-02-01-preview' = {
  name:name
  location:location
  sku:{
    name:'GP_Gen5'
    capacity:4
    family:'Gen5'
    tier:'GeneralPurpose'
  }
  properties:{
    administratorLogin:adminUsername
    administratorLoginPassword:adminPassword
    subnetId:subnet.id
    storageSizeInGB:32
    vCores:4
    licenseType:'LicenseIncluded'
    requestedBackupStorageRedundancy:'Local'
    publicDataEndpointEnabled:false
  }
}
