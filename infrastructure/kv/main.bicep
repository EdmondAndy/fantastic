param name string
param diagnosticSettings array
param enablePurgeProtection bool
param enableRbacAuthorization bool
param keys array
param networkAcls object
param privateEndpoints array
param secrets array
param softDeleteRetentionInDays int
param tags object

module vault 'br/public:avm/res/key-vault/vault:0.12.1' = {
  name: 'vaultDeployment'
  params: {
    // Required parameters
    name: name
    // Non-required parameters
    diagnosticSettings: diagnosticSettings
    enablePurgeProtection: enablePurgeProtection
    enableRbacAuthorization: enableRbacAuthorization
    keys: keys
    networkAcls: networkAcls
    privateEndpoints: privateEndpoints
    secrets: secrets
    softDeleteRetentionInDays: softDeleteRetentionInDays
    tags: tags
  }
}
