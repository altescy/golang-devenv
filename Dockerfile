FROM golang:1.11-alpine

ARG DEP_VERSION

RUN apk update && apk add --no-cache curl git gcc musl-dev && \
    curl -sL https://github.com/golang/dep/releases/download/${DEP_VERSION}/dep-linux-amd64 > /usr/bin/dep && chmod +x /usr/bin/dep
