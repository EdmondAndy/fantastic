using './main.bicep'

param name = 'vnet-aks-001-bastion'
param virtualNetworkResourceId = '/subscriptions/fa68d393-8f73-4aa3-8bed-8bd53a2920a8/resourceGroups/rg-web/providers/Microsoft.Network/virtualNetworks/vnet-aks-001'
param bastionSubnetPublicIpResourceId = '/subscriptions/fa68d393-8f73-4aa3-8bed-8bd53a2920a8/resourceGroups/rg-web/providers/Microsoft.Network/publicIPAddresses/vnet-aks-001-ip'
param diagnosticSettings = [
  {
    workspaceResourceId: '/subscriptions/fa68d393-8f73-4aa3-8bed-8bd53a2920a8/resourcegroups/rg-web/providers/microsoft.operationalinsights/workspaces/logfantastic001'
  }
]
param disableCopyPaste = true
param enableFileCopy = false
param enableIpConnect = false
param enableShareableLink = false
param location = 'australiaeast'
param scaleUnits = 2
param skuName = 'Standard'
param tags = {
  Environment: 'Non-Prod'
  'hidden-title': 'This is visible in the resource name'
  Role: 'DeploymentValidation'
}
