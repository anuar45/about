FROM alpine:latest

RUN apk update && apk add --no-cache git

WORKDIR /hugo

ADD https://github.com/gohugoio/hugo/releases/download/v0.69.1/hugo_0.69.1_Linux-64bit.tar.gz hugo.tar.gz

RUN tar -xvf hugo.tar.gz

RUN cp hugo /usr/local/bin/

RUN hugo new site about

WORKDIR /hugo/about

RUN git clone --depth 1 https://github.com/Track3/hermit.git themes/hermit

COPY . .

EXPOSE 80/tcp

ENTRYPOINT ["hugo","server","--bind=0.0.0.0","--port=80","--baseURL=https://sre.kz","--watch=false"]
