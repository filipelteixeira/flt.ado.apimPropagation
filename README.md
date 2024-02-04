# flt.ado.apimPropagation
Example for how to propagate a WebAPI in .Net 8 automatically through Azure DevOps pipelines

## Introduction
This repository contains an example of how to automatically propagate a WebAPI in .Net 8 through Azure DevOps pipelines. The example is based on the following assumptions:
- The WebAPI is hosted in Azure App Service
- The pipeline is using Azure DevOps

The article explaining this repo is available at https://filipelteixeira.com/blog/automate-dotnet8-openapi-import-to-api-management-with-azure-devops

## Prerequisites
- An Azure DevOps account
- An Azure subscription
- An Azure Resource Group
- An Azure Service Connection in Azure DevOps with access to the Azure Resource Group

## Getting started
1. Create a new Azure DevOps Project
2. Create a new Azure Service Connection in Azure DevOps with access to the desired Azure Resource Group
3. Clone the repository
3.1 Change the pipeline to match your Azure Service Connection and Azure Resource Group
3.2 Change the bicep template to match the desired services names
2. Create a new GitHub repository and push the code to the new repository
3. Create a new pipeline in Azure DevOps and select the new GitHub repository
4. Run the pipeline and verify that everything is working as expected
