param name string
param virtualNetworkResourceId string
param bastionSubnetPublicIpResourceId string
param diagnosticSettings array
param disableCopyPaste bool
param enableFileCopy bool
param enableIpConnect bool
param enableShareableLink bool
param location string
param scaleUnits int
param skuName string
param tags object

module bastionHost 'br/public:avm/res/network/bastion-host:0.6.1' = {
  name: 'bastionHostDeployment'
  params: {
    name: name
    virtualNetworkResourceId: virtualNetworkResourceId
    bastionSubnetPublicIpResourceId: bastionSubnetPublicIpResourceId
    diagnosticSettings: diagnosticSettings
    disableCopyPaste: disableCopyPaste
    enableFileCopy: enableFileCopy
    enableIpConnect: enableIpConnect
    enableShareableLink: enableShareableLink
    location: location
    scaleUnits: scaleUnits
    skuName: skuName
    tags: tags
  }
}

