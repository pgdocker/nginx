FROM alpine:latest
MAINTAINER Philip Graf <philip.graf@novapo.net>

RUN apk update && \
  apk upgrade && \
  apk add \
    ca-certificates \
    curl \
    nginx && \
  rm -rf /var/cache/apk/*

RUN curl -sLo /usr/local/bin/ep https://github.com/kreuzwerker/envplate/releases/download/v0.0.8/ep-linux && chmod +x /usr/local/bin/ep

ADD docker-entrypoint.sh /entrypoint.sh

CMD [ "/entrypoint.sh" ]
