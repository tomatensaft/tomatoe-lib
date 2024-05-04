<!-- omit in toc -->
# setup 👻

<!-- omit in toc -->
## contents

- [setup podman on wsl or debian](#setup-podman-on-wsl-or-debian)

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
