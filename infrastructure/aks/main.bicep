param name string
param location string
param primaryAgentPoolProfiles array
param aadProfile object
param agentPools array
param dnsServiceIP string
param enablePrivateCluster bool
param managedIdentities object
param networkPlugin string
param privateDNSZone string
param serviceCidr string
param skuTier string
param diagnosticSettings array
param disableLocalAccounts bool
param enableAzureDefender bool
param maintenanceConfigurations array
param monitoringWorkspaceResourceId string
param networkPolicy string
param omsAgentEnabled bool
param kubernetesVersion string

module managedCluster 'br/public:avm/res/container-service/managed-cluster:0.9.0' = {
  name: 'managedClusterDeployment'
  params: {
    name: name
    primaryAgentPoolProfiles: primaryAgentPoolProfiles
    aadProfile: aadProfile
    agentPools: agentPools
    dnsServiceIP: dnsServiceIP
    enablePrivateCluster: enablePrivateCluster
    managedIdentities: managedIdentities
    networkPlugin: networkPlugin
    privateDNSZone: privateDNSZone
    serviceCidr: serviceCidr
    skuTier: skuTier
    diagnosticSettings: diagnosticSettings
    disableLocalAccounts: disableLocalAccounts
    enableAzureDefender: enableAzureDefender
    maintenanceConfigurations: maintenanceConfigurations
    monitoringWorkspaceResourceId: monitoringWorkspaceResourceId
    networkPolicy: networkPolicy
    omsAgentEnabled: omsAgentEnabled
    location: location
    kubernetesVersion: kubernetesVersion
  }
}
