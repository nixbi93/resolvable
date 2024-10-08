FROM golang:alpine
ENTRYPOINT ["/bin/resolvable"]

RUN apk update
RUN apk add --no-cache -t build-deps go git mercurial
COPY ./config /config
COPY . /src
RUN cd /src && ./build.sh "0.3"

ONBUILD COPY ./modules.go /src/modules.go
ONBUILD RUN cd /src && ./build.sh "$(cat VERSION)-custom"
