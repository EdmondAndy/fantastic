#!/bin/bash
subscription=$(az account show --query id -o tsv)
rgId=$(az group create -n rg-web -l australiaeast --query id -o tsv)
az storage account create -n salogworksp001 -g rg-web -l australiaeast --sku Standard_LRS
az deployment group create --resource-group rg-web --template-file ./infrastructure/logs/main.bicep --parameters ./infrastructure/logs/params.bicepparam
az deployment group create --resource-group rg-web --template-file ./infrastructure/vnet/main.bicep --parameters ./infrastructure/vnet/params.bicepparam
zone_id=$(az deployment group create --resource-group rg-web --template-file ./infrastructure/dns-zone/main.bicep --parameters ./infrastructure/dns-zone/params.bicepparam --query properties.outputResources[0].id -o tsv)
principalId=$(az identity create --name idu-aks-001 --resource-group rg-web --location australiaeast --subscription $subscription --query principalId -o tsv)
az role assignment create --assignee $principalId --role "Private DNS Zone Contributor" --scope ${zone_id:1}
az network private-dns link vnet create -g rg-web -n aks-vnet -z privatelink.australiaeast.azmk8s.io -v vnet-aks-001
az deployment group create --resource-group rg-web --template-file ./infrastructure/aks/main.bicep --parameters ./infrastructure/aks/params.bicepparam