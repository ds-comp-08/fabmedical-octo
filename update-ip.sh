#!/bin/bash

# Public IP address
IP="xx.xx.xx.xx"

# Resource Group that contains AKS Node Pool
KUBERNETES_NODE_RG="MC_digitalskills_EXAMPLE-SUF_eastus"

# Name to associate with public IP address
DNSNAME="YOUR-NAME-DOMAIN"

# Get the resource-id of the public ip
PUBLICIPID=$(az network public-ip list --resource-group $KUBERNETES_NODE_RG --query "[?ipAddress!=null]|[?contains(ipAddress, '$IP')].[id]" --output tsv)

# Update public ip address with dns name
az network public-ip update --ids $PUBLICIPID --dns-name $DNSNAME
