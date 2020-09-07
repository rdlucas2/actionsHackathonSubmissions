# Container image that runs your code
FROM mcr.microsoft.com/azure-cli:latest

#the newer version is this
RUN az extension add --name azure-iot

#but the newer version wasn't working so trying this for now
#RUN az extension add --name azure-cli-iot-ext

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]