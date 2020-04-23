### Go Build stage

FROM alpine:latest

RUN apk update && apk add --no-cache git hugo ca-certificates

WORKDIR /go/src

RUN hugo new site about

WORKDIR /go/src/about

RUN git submodule add https://github.com/Track3/hermit.git themes/hermit 

COPY . .

EXPOSE 1313/tcp

ENTRYPOINT ["hugo server"]