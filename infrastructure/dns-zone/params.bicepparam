using './main.bicep'

// Required parameters
param name = 'privatelink.australiaeast.azmk8s.io'
// Non-required parameters
param location = 'global'
param lock = {
  kind: 'CanNotDelete'
  name: 'myCustomLockName'
}
param tags = {
  Environment: 'Non-Prod'
  'hidden-title': 'This is visible in the resource name'
  Role: 'DeploymentValidation'
}
