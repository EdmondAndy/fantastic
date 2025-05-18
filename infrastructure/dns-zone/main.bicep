param name string
param kvZoneName string
param location string
param crZoneName string
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

module kvprivateDnsZone 'br/public:avm/res/network/private-dns-zone:0.7.1' = {
  name: 'kvprivateDnsZoneDeployment'
  params: {
    name: kvZoneName
    location: location
    lock: lock
    tags: tags
  }
}

module crprivateDnsZone 'br/public:avm/res/network/private-dns-zone:0.7.1' = {
  name: 'crprivateDnsZoneDeployment'
  params: {
    name: crZoneName
    location: location
    lock: lock
    tags: tags
  }
}

