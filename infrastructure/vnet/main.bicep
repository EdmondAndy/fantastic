param name string
param addressPrefixes array
param flowTimeoutInMinutes int
param location string
param subnets array
param tags object


module virtualNetwork 'br/public:avm/res/network/virtual-network:0.7.0' = {
  name: 'virtualNetworkDeployment'
  params: {
    addressPrefixes: addressPrefixes
    name: name
    flowTimeoutInMinutes: flowTimeoutInMinutes
    location: location
    subnets: subnets
    tags: tags
  }
}
