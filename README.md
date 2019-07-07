### build image

```
docker build -t centos7_golang:1.12.1 .
```

### image detail
```
ENV GO111MODULE=on
ENV GOPROXY=https://goproxy.io
goroot is /go
gocmd is /go/bin/go
gopath is /gopath
workspace is /workspace  
```

### run

```
docker run -it --rm centos7_golang:1.12.1 bash
```

### usage eg:
write Dockerfile in app dir
```
FROM centos7_golang:1.12.1
RUN mkdir -p /workspace/core
COPY ./main /workspace
CMD ["/workspace/main"]
```
go mod And gen main cmd:
```
docker run --rm -v /home/znddzxx112/gopath:/gopath -v /home/znddzxx112/workspace/znddzxx112/fortest:/workspace centos7_golang:1.12.1 /go/bin/go mod init
docker run --rm -v /home/znddzxx112/gopath:/gopath -v /home/znddzxx112/workspace/znddzxx112/fortest:/workspace centos7_golang:1.12.1 /go/bin/go mod tidy
docker run --rm -v /home/znddzxx112/gopath:/gopath -v /home/znddzxx112/workspace/znddzxx112/fortest:/workspace centos7_golang:1.12.1 /go/bin/go mod vendor
docker run --rm -v /home/znddzxx112/workspace/znddzxx112/fortest:/workspace centos7_golang:1.12.1 /go/bin/go build -mod=vendor -o /workspace/main /workspace/fortest.go 
```
build app's image And run:
```
docker build -t fortest:20190706 .
docker run -d --net=host --name fortest_20190706 fortest:20190706
```
dev or debug:
```
docker run -it --net=host --name fortest_debug --rm -v /home/znddzxx112/gopath:/gopath -v /home/znddzxx112/workspace/znddzxx112/fortest:/workspace centos7_golang:1.12.1 /go/bin/go run /workspace/fortest.go
```
