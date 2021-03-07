---
title: "Container Runtime"
date: 2021-03-07
draft: true
tags: [container]
slug: "container-runtime"
summary: cri
---

## What is container runtime

Container runtime 是一個軟體，這個軟體的任務有

* 執行容器
* 管理容器的映像檔

## What is container runtime interface (CRI)

CRI 是一個k8s提供的一個介面，用來和Container runtime溝通，格式為 **protobuf**，協定為 **grpc**

## What can CRI do

* CRI允許kubernetes以單一標準和多種Container Runtime溝通，這意味著Kubernetes可以運行在多種Container Runtime之上，而不需要重新編譯
* 換句話說，CRI將Container Runtime和容器服務給標準化，任何支援CRI的Container Runtime皆可以是Kubernetes的後端

## Container runtime that support CRI

* containerd
* docker
* cri-o

## References

* [https://kubernetes.io/blog/2017/11/containerd-container-runtime-options-kubernetes/](https://kubernetes.io/blog/2017/11/containerd-container-runtime-options-kubernetes/)
* [https://kubernetes.io/blog/2016/12/container-runtime-interface-cri-in-kubernetes/](https://kubernetes.io/blog/2016/12/container-runtime-interface-cri-in-kubernetes/)