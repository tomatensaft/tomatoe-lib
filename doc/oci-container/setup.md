<!-- omit in toc -->
# setup 👻

<!-- omit in toc -->
## contents

- [setup docker on debian-wsl or debian](#setup-docker-on-debian-wsl-or-debian)
- [setup podman on wsl or debian](#setup-podman-on-wsl-or-debian)
- [docker alias](#docker-alias)

## setup docker on debian-wsl or debian

setup docker on debian esl instance or debian directly

```sh
#directory for keyrings
sudo mkdir -m 0755 -p /etc/apt/keyrings

#update meta data and install curl
sudo apt update
sudo apt install curl

#download keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo tee /etc/apt/keyrings/docker.asc
printf 'deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian bullseye stable' | sudo tee /etc/apt/sources.list.d/docker.list

#install docker engine/compose
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#test hello world
sudo docker run hello-world
```

## setup podman on wsl or debian

setup podman on debian wsl od debian directly

```sh

# install podman
sudo apt-get install podman

# start basic http server (without sudo)
podman run -dt -p 8080:80/tcp docker.io/library/httpd

# test http server
curl http://localhost:8080

#test hello world - also working
sudo podman run hello-world
```

## docker alias

set podman alias from docker command

```sh
alias docker=podman
```
