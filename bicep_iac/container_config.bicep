targetScope = 'resourceGroup'

resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2026-04-01' = {
  name: 'testaccountxxx1/default/xx1'
}
