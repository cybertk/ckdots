FROM alpine:3.14.3

LABEL maintainer "Quanlong <quanlong.he@gmail.com>"

RUN apk add --no-cache git bash

ADD init /init

RUN chmod +x /init

ENTRYPOINT ["/init"]

VOLUME /root
