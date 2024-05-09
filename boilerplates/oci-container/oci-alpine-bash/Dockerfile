# alpine latest image
FROM alpine:latest
LABEL maintainer="tomatoe-lib"

# install bash
RUN apk update && apk add bash

# run bash at container startup
CMD /bin/bash

FROM alpine
LABEL maintainer=kodekloud
RUN apk update && apk add curl
ENTRYPOINT ["curl", "--version"]