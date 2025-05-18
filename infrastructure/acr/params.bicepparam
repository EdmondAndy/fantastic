using './main.bicep'

param name = 'crfantastic001'
param acrAdminUserEnabled = true
param acrSku = 'Premium'
param azureADAuthenticationAsArmPolicyStatus = 'enabled'
param diagnosticSettings = [
  {
    workspaceResourceId: '/subscriptions/fa68d393-8f73-4aa3-8bed-8bd53a2920a8/resourcegroups/rg-web/providers/microsoft.operationalinsights/workspaces/logfantastic001'
  }
]
param exportPolicyStatus = 'enabled'
param location = 'australiaeast'
param privateEndpoints = [
  {
    privateDnsZoneGroup: {
      privateDnsZoneGroupConfigs: [
        {
          privateDnsZoneResourceId: '/subscriptions/fa68d393-8f73-4aa3-8bed-8bd53a2920a8/resourceGroups/rg-web/providers/Microsoft.Network/privateDnsZones/privatelink.azurecr.io'
        }
      ]
    }
    subnetResourceId: '/subscriptions/fa68d393-8f73-4aa3-8bed-8bd53a2920a8/resourceGroups/rg-web/providers/Microsoft.Network/virtualNetworks/vnet-aks-001/subnets/subnet-008-pep'
  }
]
param quarantinePolicyStatus = 'enabled'
param replications = [
  {
    location: 'australiasoutheast'
    name: 'auebackup'
  }
]
param softDeletePolicyDays = 7
param softDeletePolicyStatus = 'disabled'
param tags = {
  Environment: 'Non-Prod'
  'hidden-title': 'This is visible in the resource name'
  Role: 'DeploymentValidation'
}
param trustPolicyStatus = 'enabled'
