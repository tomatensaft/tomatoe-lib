<!-- omit in toc -->
# setup 👻

<!-- omit in toc -->
## contents

- [setup powershell on linux](#setup-powershell-on-linux)
- [remove powershell on linux](#remove-powershell-on-linux)

## setup powershell on linux

```sh

# update the list of packages
sudo apt-get update

# install pre-requisite packages.
sudo apt-get install -y wget

# get the version of Debian
source /etc/os-release

# download the Microsoft repository GPG keys
wget -q https://packages.microsoft.com/config/debian/$VERSION_ID/packages-microsoft-prod.deb

# register the Microsoft repository GPG keys
sudo dpkg -i packages-microsoft-prod.deb

# delete the Microsoft repository GPG keys file
rm packages-microsoft-prod.deb

# update the list of packages after we added packages.microsoft.com
sudo apt-get update

# install PowerShell
sudo apt-get install -y powershell

# start PowerShell
pwsh

```

## remove powershell on linux

```sh
sudo apt-get remove powershell

```
