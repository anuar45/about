---
title: "Simple personal CI/CD"
date: 2020-05-29
toc: false
images:
tags: 
  - cicd
  - watchtower
  - traefik
---

Here i will explain how my personal cicd works, it costs me only 5$ digitalocean instance. Hope it will be helpful...

First of all list of used tools:

- Traefik - as reverse proxy with lets encrypt
- Github - as git repository
- Docker Hub - as docker images registry, and build tool
- [Watchtower](https://github.com/containrrr/watchtower) - refreshes running container with new version

You can find all of the code [here](https://github.com/anuar45/srekz)


For now briefly, will add more later:
- Code pushed to github with version tag 
- Code tested with Github actions
- Docker Hub monitors and build tagged versions
- Watchtower monitors and pulls new docker image, restarts exesiting one with new one
- Traefik monitors running contrainers and expose them with lets encrypt certs