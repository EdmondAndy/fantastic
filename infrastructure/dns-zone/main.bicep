param name string
param location string
param lock object
param tags object

module aksprivateDnsZone 'br/public:avm/res/network/private-dns-zone:0.7.1' = {
  name: 'privateDnsZoneDeployment'
  params: {
    name: name
    location: location
    lock: lock
    tags: tags
  }
}
