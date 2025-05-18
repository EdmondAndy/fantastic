param name string
param acrAdminUserEnabled bool
param acrSku string
param azureADAuthenticationAsArmPolicyStatus string
param diagnosticSettings array
param exportPolicyStatus string
param location string
param privateEndpoints array
param quarantinePolicyStatus string
param replications array
param softDeletePolicyDays int
param softDeletePolicyStatus string
param tags object
param trustPolicyStatus string

module registry 'br/public:avm/res/container-registry/registry:0.9.1' = {
  name: 'registryDeployment'
  params: {
    // Required parameters
    name: name
    // Non-required parameters
    acrAdminUserEnabled: acrAdminUserEnabled
    acrSku: acrSku
    azureADAuthenticationAsArmPolicyStatus: azureADAuthenticationAsArmPolicyStatus
    diagnosticSettings: diagnosticSettings
    exportPolicyStatus: exportPolicyStatus
    location: location
    privateEndpoints: privateEndpoints
    quarantinePolicyStatus: quarantinePolicyStatus
    replications: replications
    softDeletePolicyDays: softDeletePolicyDays
    softDeletePolicyStatus: softDeletePolicyStatus
    tags: tags
    trustPolicyStatus: trustPolicyStatus
  }
}
