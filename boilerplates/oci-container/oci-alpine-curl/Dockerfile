# alpine latest image
FROM alpine:latest
LABEL maintainer="tomatoe-lib"

# install curl
RUN apk update && apk add curl
ENTRYPOINT ["curl", "--version"]