FROM golang:1.15.0-alpine3.12 AS builder

ENV GO111MODULE on
ENV GOPROXY https://goproxy.cn

RUN apk upgrade \
    && apk add git \
    && go get github.com/bugfan/shadowsocks-go

FROM alpine:3.12 AS dist

LABEL maintainer="mritd <mritd@linux.com>"

RUN apk upgrade \
    && apk add tzdata \
    && rm -rf /var/cache/apk/*

COPY --from=builder /go/bin/shadowsocks-go /usr/bin/shadowsocks

ENTRYPOINT ["shadowsocks"]
