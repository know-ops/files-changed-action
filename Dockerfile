FROM alpine/git:v2.24.1

RUN apk add bash

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
