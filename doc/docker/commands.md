<!-- omit in toc -->
# commands 💻

some commands for control docker from commandline

<!-- omit in toc -->
## contents

- [system](#system)
- [docker images](#docker-images)
- [docker containter](#docker-containter)
- [docker network](#docker-network)
- [docker volumes](#docker-volumes)
- [Conttainerfile example](#Conttainerfile-example)
- [docker-compose](#docker-compose)
- [docker checkpoint](#docker-checkpoint)
- [sources](#sources)

## system

list running containers

```sh
docker ps -a
```

view container statistics

```sh
docker stats
```

view disk usage of docker system

```sh
docker system df
```

remove unused docker data

```sh
docker system prune -af
```

## docker images

view active images

```sh
docker images
```

list images

```sh
docker images ls
```

inspect image

```sh
docker image inspect **[image]**
```

delete all active images

```sh
 docker rmi $(docker images -a -q)
```

## docker containter

docker start/stop/restart

```sh
docker start **[containerid]**
docker stop **[containerid]**
docker restart **[containerid]**
```

stop all containers

```sh
docker stop $(docker ps -a -q) 
```

log in into container

```sh
docker exec -it **[containerid]** /bin/sh
```

view container logile

```sh
docker log **[containerid]**
```

remote all container

```sh
docker rm -f $(docker ps -a -q)
```

## docker network

list docker networks

```sh
docker network ls
```

remove all docker networks

```sh
docker network rm $(docker network ls -q)
```

list remove unused networks

```sh
docker network prune
```

network instpect (for up address)

```sh
docker network inspect **[containerid]**
```

## docker volumes

list docker volumes

```sh
docker volume ls
```

list docker volumes

```sh
docker volume inspect **[volumeid]**
```

volumen create/delete

```sh
docker volume create **[volumeid]**
docker volume delete **[volumeid]**
```

remove all docker volumes

```sh
docker volume rm $(docker volume ls -q)
```

## Conttainerfile example

simple `Conttainerfile` example build with `docker build .`

```sh
FROM alpine:3.14
RUN apk add --no-cache mysql-client
ENTRYPOINT ["mysql"]
```

## docker-compose

docker-compose via `composeyml` configuration file

docker-compose start/stop/restart

```sh
docker-compose start
docker-compose stop
docker-compose restart
```

docker-compose up

```sh
docker-compose up
```

docker-compose down

```sh
docker-compose down
```

docker-compose logs

```sh
docker-compose logs
```

list running compose projects

```sh
docker-compose ls
```

## docker checkpoint

create checkpoint for save and restore container state

create checkpoint

```sh
docker checkpoint create **[containerid]** **[checkpointid]**
```

list checkpoints

```sh
docker checkpoint ls **[containerid]**
```

restore container from checkpoint

```sh
docker checkpoint start --checkpoint **[checkpointid]** **[containerid]** 
```

## sources

[docker-cli](https://docs.docker.com/reference/cli/)
[alpine-image](https://www.docker.com/blog/how-to-use-the-alpine-docker-official-image/)
