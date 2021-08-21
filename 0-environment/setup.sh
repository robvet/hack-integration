#/bin/bash

# updates
sudo apt-get update -y && sudo apt-get upgrade -y

# azure cli
# https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux
sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg
curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
AZ_REPO=$(lsb_release -cs)
echo $AZ_REPO
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list
cat /etc/apt/sources.list.d/azure-cli.list
sudo apt-get update -y
sudo apt-get install azure-cli -y

# azure functions core tools 3
# https://docs.microsoft.com/en-us/azure/azure-functions/functions-run-local
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-$(lsb_release -cs)-prod $(lsb_release -cs) main" > /etc/apt/sources.list.d/dotnetdev.list'
cat /etc/apt/sources.list.d/dotnetdev.list
sudo apt-get update -y
sudo apt-get install azure-functions-core-tools-3 -y
echo 'export FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT=1' >> ~/.bashrc
cat ~/.bashrc

# dotnet core sdk 5
# https://docs.microsoft.com/en-us/dotnet/core/install/linux-ubuntu
wget https://packages.microsoft.com/config/ubuntu/21.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get install apt-transport-https -y
sudo apt-get install -y dotnet-sdk-5.0 -y
echo 'export DOTNET_CLI_TELEMETRY_OPTOUT=1' >> ~/.bashrc
cat ~/.bashrc

# nodejs 14.17.5
# https://github.com/nodejs/help/wiki/Installation
wget https://nodejs.org/dist/v14.17.5/node-v14.17.5-linux-x64.tar.xz
VERSION=v14.17.5
DISTRO=linux-x64
sudo mkdir -p /usr/local/lib/nodejs
ll /usr/local/lib/nodejs
sudo tar -xJvf node-$VERSION-$DISTRO.tar.xz -C /usr/local/lib/nodejs
echo 'VERSION=v14.17.5' >> ~/.bashrc
echo 'DISTRO=linux-x64' >> ~/.bashrc
echo 'export PATH=/usr/local/lib/nodejs/node-$VERSION-$DISTRO/bin:$PATH' >> ~/.bashrc
cat ~/.bashrc
. ~/.profile
node -v
npm version
npx -v