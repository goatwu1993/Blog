---
title: "Docker commands"
date: 2020-01-15T20:36:03+08:00
draft: false
tags: [container, docker]
slug: "docker-commands"
summary: docker commands
---

## container

```bash
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
```

## docker-compose

```bash
docker-compose ps
docker-compose ps -a

docker-compose down
docker-compose scale kafka=3
```
