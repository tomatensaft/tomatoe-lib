# debian lib

## general debian commands/tools

``` sh
wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
```

## install sdk

``` sh
sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-8.0
```

## install asp net core

```sh
sudo apt-get update && \
  sudo apt-get install -y aspnetcore-runtime-8.0
```

## install .net runtime

```sh
sudo apt-get install -y dotnet-runtime-8.0
```
