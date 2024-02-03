// APIM
@description('The name of the API Management service instance')
param apiManagementServiceName string = 'apiserviceFltAdoApimPropagation'

@description('The email address of the owner of the service')
param publisherEmail string = 'filipelteixeira@gmail.com'

@description('The name of the owner of the service')
param publisherName string = 'flt.'

@description('The pricing tier of this API Management service')
@allowed([
  'Consumption'
  'Developer'
  'Basic'
  'Standard'
  'Premium'
])
param apimSku string = 'Developer'

@description('The instance size of this API Management service.')
@allowed([
  0
  1
  2
])
param skuCount int = 1

@description('Location for all resources.')
param location string = resourceGroup().location

resource apiManagementService 'Microsoft.ApiManagement/service@2022-08-01' = {
  name: apiManagementServiceName
  location: location
  sku: {
    name: apimSku
    capacity: skuCount
  }
  properties: {
    publisherEmail: publisherEmail
    publisherName: publisherName
  }
}

// App Service
@description('Web app name.')
param webAppName string = 'appServiceFltAdoApimPropagation'


@description('Describes plan\'s pricing tier and instance size. Check details at https://azure.microsoft.com/en-us/pricing/details/app-service/')
@allowed([
  'F1'
  'D1'
  'B1'
  'B2'
  'B3'
  'S1'
  'S2'
  'S3'
  'P1'
  'P2'
  'P3'
  'P4'
])
param sku string = 'B1'

@description('The language stack of the app.')
@allowed([
  '.net'
  'php'
  'node'
  'html'
])
param language string = '.net'

var appServicePlanName = 'appServicePlanFltAdoApimPropagation'

var configReference = {
  '.net': {
    comments: '.Net app. No additional configuration needed.'
  }
}

resource asp 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: sku
  }
}

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: webAppName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    siteConfig: union(configReference[language],{
      minTlsVersion: '1.2'
      scmMinTlsVersion: '1.2'
      ftpsState: 'FtpsOnly'
    })
    serverFarmId: asp.id
    httpsOnly: true
  }
}
