FROM centos:7

# golang:1.12.1

COPY . /

RUN sh /scripts/prepare.sh && sh /scripts/clean.sh

ENV GO111MODULE=on
ENV GOPROXY=https://goproxy.io
ENV GOROOT /go
ENV GOPATH /gopath

WORKDIR /workspace


