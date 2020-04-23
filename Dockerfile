### Go Build stage

FROM alpine:latest

RUN apk update && apk add --no-cache hugo

WORKDIR /hugo

RUN hugo new site about

WORKDIR /hugo/about

ADD https://github.com/Track3/hermit/archive/master.tar.gz themes/hermit

COPY . .

EXPOSE 1313/tcp

ENTRYPOINT ["hugo server"]