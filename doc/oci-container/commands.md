<!-- omit in toc -->
# commands 💻

some commands for control docker / podman from commandline

<!-- omit in toc -->
## contents

- [docker / podman compatibility](#docker--podman-compatibility)
- [system](#system)
- [container images](#container-images)
- [oci containter](#oci-containter)
- [container network](#container-network)
- [container volumes](#container-volumes)
- [Conttainerfile example](#conttainerfile-example)
- [container compose](#container-compose)
- [container checkpoint](#container-checkpoint)
- [sources](#sources)

## docker / podman compatibility

podman is mostly compatible to docker commands  
in this documentation are always docker and podman commands compatible

## system

list running containers

```sh
docker ps -a

podman ps -a
```

view container statistics

```sh
docker stats

podman stats
```

view disk usage of container system

```sh
docker system df

podman system off
```

remove unused container data

```sh
docker system prune -af

podman system prune -af
```

remove all container system data

```sh
docker rmi $(docker images -qa) -f
docker system prune --all --force && docker rmi --all

podman rmi $(dpodman images -qa) -f
podman system prune --all --force && podman rmi --all
```

## container images

view active images

```sh
docker images

podman images
```

list images

```sh
docker images ls

podman images ls
```

inspect image

```sh
docker image inspect **[image]**

podman image inspect **[image]**
```

delete all active images

```sh
docker rmi $(docker images -a -q)

podman rmi $(podman images -a -q)
```

build image from `Dockerfile`

```sh
docker build .
docker build . -t image-tag:1.0.0

podman build .
podman build . -t image-tag:1.0.0

```

## oci containter

containers start/stop/restart

```sh
docker start **[containerid]**
docker stop **[containerid]**
docker restart **[containerid]**

podman start **[containerid]**
podman stop **[containerid]**
podman restart **[containerid]**

```

stop all containers

```sh
docker stop $(docker ps -a -q) 

podman stop $(podman ps -a -q) 
```

log in into container

```sh
docker exec -it **[containerid]** /bin/sh

podman exec -it **[containerid]** /bin/sh
```

view container logile

```sh
docker log **[containerid]**

podman log **[containerid]**
```

remove all container

```sh
docker rm -f $(docker ps -a -q)

podman rm -f $(podman ps -a -q)
```

## container network

list container networks

```sh
docker network ls

podman network ls
```

remove all container networks

```sh
docker network rm $(docker network ls -q)

podman network rm $(podman network ls -q)
```

list remove unused networks

```sh
docker network prune

podman network prune
```

network instpect (for up address)

```sh
docker network inspect **[containerid]**

podman network inspect **[containerid]**
```

## container volumes

list container volumes

```sh
docker volume ls

podman volume ls
```

list container volumes

```sh
docker volume inspect **[volumeid]**

podman volume inspect **[volumeid]**
```

volumen create/delete

```sh
docker volume create **[volumeid]**
docker volume delete **[volumeid]**

podman volume create **[volumeid]**
podman volume delete **[volumeid]**
```

remove all container volumes

```sh
docker volume rm $(docker volume ls -q)

podman volume rm $(podman volume ls -q)
```

## Conttainerfile example

simple `Containerfile` example build with `docker build .`

```sh
FROM alpine:3.14
RUN apk add --no-cache mysql-client
ENTRYPOINT ["mysql"]
```

## container compose

docker-compose / podman-compose via `compose.yml` configuration file

docker-compose / podman-compose start/stop/restart

```sh
docker-compose start
docker-compose stop
docker-compose restart

podman-compose start
podman-compose stop
podman-compose restart
```

docker-compose / podman compose up

```sh
docker-compose up

podman-compose up
```

docker-compose / podman-compose down

```sh
docker-compose down

podman-compose down
```

docker-compose / podman-compose logs

```sh
docker-compose logs

podman-compose logs
```

list running compose projects

```sh
docker-compose ls

podman-compose ls
```

## container checkpoint

create checkpoint for save and restore container state

create checkpoint

```sh
docker checkpoint create **[containerid]** **[checkpointid]**

podman checkpoint create **[containerid]** **[checkpointid]**
```

list checkpoints

```sh
docker checkpoint ls **[containerid]**

podman checkpoint ls **[containerid]**
```

restore container from checkpoint

```sh
docker checkpoint start --checkpoint **[checkpointid]** **[containerid]** 

podman checkpoint start --checkpoint **[checkpointid]** **[containerid]** 
```

## sources

[docker-cli](https://docs.docker.com/reference/cli/)
[podman](https://docs.podman.io/en/latest/)
[alpine-image](https://www.docker.com/blog/how-to-use-the-alpine-docker-official-image/)
