using './main.bicep'

param addressPrefixes= [
      '172.16.0.0/20'
]
param name= 'vnet-aks-001'
param flowTimeoutInMinutes = 20
param location = 'australiaeast'
param subnets= [
      {
        addressPrefix: '172.16.0.0/24'
        name: 'subnet-001-system-nodes'
      }
      {
        addressPrefix: '172.16.2.0/23'
        name: 'subnet-002-worker-nodes'
      }
      {
        addressPrefix: '172.16.4.0/23'
        name: 'subnet-003-system-pods'
      }
      {
        addressPrefix: '172.16.8.0/22'
        name: 'subnet-004-worker-pods'
      }
      {
        addressPrefix: '172.16.6.0/24'
        name: 'subnet-005-azure-fw'
      }
      {
        addressPrefix: '172.16.7.0/24'
        name: 'subnet-006-bastion'
      }
      {
        addressPrefix: '172.16.12.0/24'
        name: 'subnet-007-app-gateway'
      }
      {
        addressPrefix: '172.16.13.0/24'
        name: 'subnet-008-devops-agents'
      }
      {
        addressPrefix: '172.16.14.0/24'
        name: 'subnet-008-pep'
      }

]
param tags = {
  Environment: 'Non-Prod'
  'hidden-title': 'This is visible in the resource name'
  Role: 'DeploymentValidation'
}
