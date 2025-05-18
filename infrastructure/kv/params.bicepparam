using './main.bicep'

// Required parameters
param name = 'kvfantastic001'
// Non-required parameters
param diagnosticSettings = [
  {
    workspaceResourceId: '/subscriptions/fa68d393-8f73-4aa3-8bed-8bd53a2920a8/resourcegroups/rg-web/providers/microsoft.operationalinsights/workspaces/logfantastic001'
  }
]
param enablePurgeProtection = false
param enableRbacAuthorization = true
param keys = [
  {
    attributes: {
      enabled: true
      exp: 1702648632
      nbf: 10000
    }
    keySize: 4096
    name: 'keyName'
    rotationPolicy: {
      attributes: {
        expiryTime: 'P2Y'
      }
      lifetimeActions: [
        {
          action: {
            type: 'Rotate'
          }
          trigger: {
            timeBeforeExpiry: 'P2M'
          }
        }
        {
          action: {
            type: 'Notify'
          }
          trigger: {
            timeBeforeExpiry: 'P30D'
          }
        }
      ]
    }
  }
]
param networkAcls = {
  bypass: 'AzureServices'
  defaultAction: 'Deny'
}
param privateEndpoints = [
  {
    privateDnsZoneGroup: {
      privateDnsZoneGroupConfigs: [
        {
          privateDnsZoneResourceId: '/subscriptions/fa68d393-8f73-4aa3-8bed-8bd53a2920a8/resourceGroups/rg-web/providers/Microsoft.Network/privateDnsZones/privatelink.vaultcore.azure.net'
        }
      ]
    }
    service: 'vault'
    subnetResourceId: '/subscriptions/fa68d393-8f73-4aa3-8bed-8bd53a2920a8/resourceGroups/rg-web/providers/Microsoft.Network/virtualNetworks/vnet-aks-001/subnets/subnet-008-pep'
  }
]
param secrets = [
  {
    attributes: {
      enabled: true
      exp: 1702648632
      nbf: 10000
    }
    contentType: 'Something'
    name: 'secretName'
    value: 'secretValue'
  }
]
param softDeleteRetentionInDays = 7
param tags = {
  Environment: 'Non-Prod'
  'hidden-title': 'This is visible in the resource name'
  Role: 'DeploymentValidation'
}
