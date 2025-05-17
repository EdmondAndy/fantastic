using './main.bicep'

// Required parameters
param name = 'fanstatic001'
param primaryAgentPoolProfiles = [
  {
    availabilityZones: [1,2,3]
    count: 1
    enableAutoScaling: true
    maxCount: 3
    maxPods: 50
    minCount: 1
    mode: 'System'
    name: 'systempool'
    nodeTaints: [
      'CriticalAddonsOnly=true:NoSchedule'
    ]
    osDiskSizeGB: 256
    osType: 'Linux'
    type: 'VirtualMachineScaleSets'
    vmSize: 'Standard_d4_v3'
    vnetSubnetResourceId: '/subscriptions/fa68d393-8f73-4aa3-8bed-8bd53a2920a8/resourceGroups/rg-web/providers/Microsoft.Network/virtualNetworks/vnet-aks-001/subnets/subnet-001-system-nodes'
    podSubnetResourceId: '/subscriptions/fa68d393-8f73-4aa3-8bed-8bd53a2920a8/resourceGroups/rg-web/providers/Microsoft.Network/virtualNetworks/vnet-aks-001/subnets/subnet-003-system-pods'
  }
]
// Non-required parameters
param aadProfile = {
  aadProfileEnableAzureRBAC: true
  aadProfileManaged: true
}
param agentPools = [
  {
    availabilityZones: [1,2,3]
    count: 1
    enableAutoScaling: true
    maxCount: 3
    maxPods: 110
    minCount: 1
    minPods: 1
    mode: 'User'
    name: 'userpool1'
    nodeLabels: {}
    osDiskSizeGB: 256
    //osDiskType: 'Ephemeral' for some reason my payg sub does not support dsv series vm
    osType: 'Linux'
    scaleSetEvictionPolicy: 'Delete'
    scaleSetPriority: 'Regular'
    type: 'VirtualMachineScaleSets'
    vmSize: 'Standard_d4_v3'
    vnetSubnetResourceId: '/subscriptions/fa68d393-8f73-4aa3-8bed-8bd53a2920a8/resourceGroups/rg-web/providers/Microsoft.Network/virtualNetworks/vnet-aks-001/subnets/subnet-002-worker-nodes'
    podSubnetResourceId: '/subscriptions/fa68d393-8f73-4aa3-8bed-8bd53a2920a8/resourceGroups/rg-web/providers/Microsoft.Network/virtualNetworks/vnet-aks-001/subnets/subnet-004-worker-pods'
 }
]
param dnsServiceIP = '10.10.200.10'
param enablePrivateCluster = true
param managedIdentities = {
  userAssignedResourceIds: [
    '/subscriptions/fa68d393-8f73-4aa3-8bed-8bd53a2920a8/resourceGroups/rg-web/providers/Microsoft.ManagedIdentity/userAssignedIdentities/idu-aks-001'
  ]
}
param networkPlugin = 'azure'
param disableLocalAccounts= true
param enableAzureDefender= true
param privateDNSZone = '/subscriptions/fa68d393-8f73-4aa3-8bed-8bd53a2920a8/resourceGroups/rg-web/providers/Microsoft.Network/privateDnsZones/privatelink.australiaeast.azmk8s.io'
param serviceCidr = '10.10.200.0/24'
param skuTier = 'Free'
param diagnosticSettings= [
{
        logCategoriesAndGroups: [
          {
            category: 'kube-apiserver'
          }
          {
            category: 'kube-controller-manager'
          }
          {
            category: 'kube-scheduler'
          }
          {
            category: 'cluster-autoscaler'
          }
        ]
        metricCategories: [
          {
            category: 'AllMetrics'
          }
        ]
        name: 'customSetting'
        workspaceResourceId: '/subscriptions/fa68d393-8f73-4aa3-8bed-8bd53a2920a8/resourcegroups/rg-web/providers/microsoft.operationalinsights/workspaces/logfantastic001'
      }
]
param maintenanceConfigurations= [
      {
        maintenanceWindow: {
          durationHours: 4
          schedule: {
            weekly: {
              dayOfWeek: 'Sunday'
              intervalWeeks: 1
            }
          }
          startDate: '2025-05-20'
          startTime: '00:00'
          utcOffset: '+00:00'
        }
        name: 'aksManagedAutoUpgradeSchedule'
      }
      {
        maintenanceWindow: {
          durationHours: 4
          schedule: {
            weekly: {
              dayOfWeek: 'Sunday'
              intervalWeeks: 1
            }
          }
          startDate: '2025-05-20'
          startTime: '00:00'
          utcOffset: '+00:00'
        }
        name: 'aksManagedNodeOSUpgradeSchedule'
      }
    ]
param monitoringWorkspaceResourceId='/subscriptions/fa68d393-8f73-4aa3-8bed-8bd53a2920a8/resourcegroups/rg-web/providers/microsoft.operationalinsights/workspaces/logfantastic001'
param networkPolicy='azure'
param omsAgentEnabled= true
param location='australiaeast'
param kubernetesVersion='1.31.7'
