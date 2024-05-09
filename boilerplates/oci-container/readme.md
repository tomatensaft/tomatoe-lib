
<!-- omit in toc -->
# oci-container boilerplate

oci boilerplate for docker and podman
docker namin is used because it works with docker and podman

<!-- omit in toc -->
## contents

- [setup docker](#setup-docker)
- [setup podman](#setup-podman)
- [usage](#usage)
- [oci standardfiles](#oci-standardfiles)

## setup docker

- disable podman with `sudo systemctl stop docker.service`
- setup docker (documentation)[]

## setup podman

- disable docker with `sudo systemctl disable --now docker.service docker.socket`
- setup podman (documentation)[]

## usage

- adjust `Dockerfile` and `docker-compose.yml`
- start with `docker-compose up` or `podman-compose up`

## oci standardfiles

standard naming for oci files

oci-standard compose files (only podman)

```sh
Containerfile
container-compose.yml
```

docker compose files (docker and podman)

```sh
Dockerrfile
docker-compose.yml
```

podman compose files (only podman)

```sh
Containerfile
podman-compose.yml
```
