
<!-- omit in toc -->
# oci-container boilerplate

oci boilerplate for docker and podman

<!-- omit in toc -->
## contents

- [setup](#setup)
- [usage](#usage)
- [oci standardfiles](#oci-standardfiles)

## setup

- setup docker (see docker documentation)
- setup podman (see podman documentation)

## usage

- adjust `Dockerfile` and `docker-compose.yml`
- start with `docker-compose up` or `podman-compose up`

## oci standardfiles

standard naming for oci files - for podman works all

oci-standard compose files

```sh
Containerfile
container-compose.yml
```

docker compose files

```sh
Dockerrfile
docker-compose.yml
```

podman compose files

```sh
Containerfile
podman-compose.yml
```
