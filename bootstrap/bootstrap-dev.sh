#!/bin/bash
# this script is used to bootstrap the basic infrastructure for the dev environment, e.g. vnet, law, dns-zone, mi, etc.
subscription=$(az account show --query id -o tsv)
rgName='rg-web'
location='australiaeast'
rgId=$(az group create -n $rgName -l $location --query id -o tsv)
az storage account create -n salogworksp001 -g $rgName -l $location --sku Standard_LRS
az deployment group create --resource-group $rgName --template-file ../infrastructure/logs/main.bicep --parameters ../infrastructure/logs/params.bicepparam
az deployment group create --resource-group $rgName --template-file ../infrastructure/vnet/main.bicep --parameters ../infrastructure/vnet/params.bicepparam
zone_id=$(az deployment group create --resource-group $rgName --template-file ../infrastructure/dns-zone/main.bicep --parameters ../infrastructure/dns-zone/params.bicepparam --query properties.outputResources[0].id -o tsv)
principalId=$(az identity create --name idu-aks-001 --resource-group $rgName --location $location --subscription $subscription --query principalId -o tsv)
az role assignment create --assignee $principalId --role "Private DNS Zone Contributor" --scope ${zone_id:1}
az network private-dns link vnet create -g $rgName -n aks-vnet -z privatelink.australiaeast.azmk8s.io -v vnet-aks-001