#!/bin/sh -l

AZ_USERNAME=$1
AZ_PASSWORD=$2
AZ_TENANT=$3
#AZ_DEVICE_ID=$4
AZ_HUB_NAME=$4
DEVICE_LIST_FILE_PATH=$5

#AZ_RG_NAME=$6
#VM_ADMIN_USER=$7
#VM_ADMIN_PASSWORD=$8
#VM_NAME=$9

#az --version

az extension add --name azure-iot

az login --service-principal -u ${AZ_USERNAME} -p ${AZ_PASSWORD} --tenant ${AZ_TENANT}
#az account show

#search_dir=$(pwd)
#for entry in "$search_dir"/*
#do
#  echo "$entry"
#done

cat ${DEVICE_LIST_FILE_PATH}
echo " "

while IFS= read -r line || [ -n "$line" ]; 
do 
    echo $line;
    az iot hub device-identity create --device-id ${line} --hub-name ${AZ_HUB_NAME} --edge-enabled
done < ${DEVICE_LIST_FILE_PATH}

#create a new device
#az iot hub device-identity create --device-id ${AZ_DEVICE_ID} --hub-name ${AZ_HUB_NAME} --edge-enabled

#get the device connection string
#connString=$(az iot hub device-identity show-connection-string --device-id ${AZ_DEVICE_ID} --hub-name ${AZ_HUB_NAME})
#echo "::set-output name=connString::$connString"

#az group create --location EastUS --name ${AZ_RG_NAME}
#az deployment group create --resource-group ${AZ_RG_NAME} --template-uri "https://aka.ms/iotedge-vm-deploy" --parameters dnsLabelPrefix=${VM_NAME} --parameters adminUsername=${VM_ADMIN_USER} --parameters deviceConnectionString=$(az iot hub device-identity show-connection-string --device-id ${AZ_DEVICE_ID} --hub-name ${AZ_HUB_NAME} -o tsv) --parameters authenticationType='password' --parameters adminPasswordOrKey="${VM_ADMIN_PASSWORD}"
