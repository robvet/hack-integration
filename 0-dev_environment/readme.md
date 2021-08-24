# Overview

## Development Environment Configuration

The following configuration options should work for this hack

### Windows 10 with Ubuntu WSL
    - Visual Studio (C#)
        - Azure Development Workload
        - .NET cross platform development
    - VS Code (JavaScript, Python)
        - Azure Account extension
        - Azure logic app (standard) extension
        - Azure Functions extension
        - WSL extension
    - WSL Ubuntu 20.04
        - Azure CLI
        - Azure Functions Core Tools 3
        - .NET Core SDK 5
        - Nodejs 14.17.5

### macOS
    - Azure CLI
    - Azure Functions Core Tools 3
    - .NET Core SDK
    - VS Code (JavaScript, Python)
        - Azure Account extension
        - Azure logic app (standard) extension
        - Azure Functions extension
        - WSL extension


## Ubuntu 20.04 Install Reference

### Ubuntu Updates

    sudo apt-get update -y && sudo apt-get upgrade -y

### Azure CLI

[Install Azure CLI on Linux](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux)

```bash
sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg
curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
AZ_REPO=$(lsb_release -cs)
echo $AZ_REPO
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list
cat /etc/apt/sources.list.d/azure-cli.list
sudo apt-get update -y
sudo apt-get install azure-cli -y
```

### Azure Functions Core Tools 3

[Work with Azure Functions Core Tools on Ubuntu](https://docs.microsoft.com/en-us/azure/azure-functions/functions-run-local?tabs=linux)

```bash
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-$(lsb_release -cs)-prod $(lsb_release -cs) main" > /etc/apt/sources.list.d/dotnetdev.list'
cat /etc/apt/sources.list.d/dotnetdev.list
sudo apt-get update -y
sudo apt-get install azure-functions-core-tools-3 -y
echo 'export FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT=1' >> ~/.bashrc
cat ~/.bashrc
```

### Dotnet Core SDK 5

[Install the .NET SDK or the .NET Runtime on Ubuntu](https://docs.microsoft.com/en-us/dotnet/core/install/linux-ubuntu)

```bash
wget https://packages.microsoft.com/config/ubuntu/21.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get install apt-transport-https -y
sudo apt-get install -y dotnet-sdk-5.0 -y
echo 'export DOTNET_CLI_TELEMETRY_OPTOUT=1' >> ~/.bashrc
cat ~/.bashrc
```

### Nodejs 14.17.5

[How to install Node.js via binary archive on Linux](https://github.com/nodejs/help/wiki/Installation)

```bash
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
```

## macOS Install Reference

### Homebrew

Homebrew macOS Requirements
 - A 64-bit Intel CPU or Apple Silicon CPU
 - macOS Mojave (10.14) (or higher)
 - Command Line Tools (CLT) for Xcode: xcode-select --install, developer.apple.com/downloads or Xcode 3
    - NOTE: Some homebrew formulae require full the Xcode installation which may require an Apple Developer account. You can get an Apple Developer account [here](https://developer.apple.com/register/index.action)
 - A Bourne-compatible shell for installation (e.g. bash or zsh)

[Install homebrew package manager](https://docs.brew.sh/Installation)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Azure CLI

[Install Azure CLI on macOS](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-macOS)

For the macOS platform, you can install the Azure CLI with the homebrew package manager

```bash
brew update && brew install azure-cli
```

### Azure Functions Core Tools 3

[Work with Azure Functions Core Tools on macOS](https://docs.microsoft.com/en-us/azure/azure-functions/functions-run-local?tabs=macOS)

```bash
brew tap azure/functions
brew install azure-functions-core-tools@3

# if upgrading on a machine that has 2.x installed
brew link --overwrite azure-functions-core-tools@3
```

### Dotnet Core SDK 5

[Install .NET on macOS Overview](https://docs.microsoft.com/en-us/dotnet/core/install/macos)

[Standalone installer for .NET on macOS](https://dotnet.microsoft.com/download/dotnet/thank-you/sdk-5.0.400-macos-x64-installer)

### Nodejs 14.17.5

[Node.js macOS Installer (.pkg)](https://nodejs.org/dist/v14.17.5/node-v14.17.5.pkg)
