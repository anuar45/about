### Go Build stage

FROM alpine:latest

RUN apk update && apk add --no-cache hugo git

WORKDIR /hugo

RUN hugo new site about

WORKDIR /hugo/about

RUN git clone --depth 1 https://github.com/Track3/hermit.git themes/hermit

COPY . .

EXPOSE 1313/tcp

ENTRYPOINT ["hugo","server","--bind=0.0.0.0","--watch=false"]
