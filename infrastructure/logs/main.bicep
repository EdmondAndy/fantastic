param name string
param dailyQuotaGb int
param dataSources array
param features object
param linkedStorageAccounts array
param location string
param publicNetworkAccessForIngestion string
param publicNetworkAccessForQuery string
param tags object



module workspace 'br/public:avm/res/operational-insights/workspace:0.11.2' = {
  name: 'workspaceDeployment'
  params: {
    name: name
    dailyQuotaGb: dailyQuotaGb
    dataSources: dataSources
    features: features
    linkedStorageAccounts: linkedStorageAccounts
    location: location
    publicNetworkAccessForIngestion: publicNetworkAccessForIngestion
    publicNetworkAccessForQuery: publicNetworkAccessForQuery
    tags: tags
  }
}
