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
  * 管理容器的生命週期
  * 和容器互動
* 管理容器的映像檔，例如
  * 下載更新(Pull)容器映像檔
  * 移除容器映像檔
* PodSandbox(容器的運行環境)

## What is container runtime interface (CRI)

CRI 是一個k8s提供的一個介面，用來和Container runtime溝通，格式為 **protobuf**，協定為 **grpc**

## What can CRI do

* CRI允許kubernetes以單一標準和多種Container Runtime溝通，這意味著Kubernetes可以運行在多種Container Runtime之上，而不需要重新編譯
* 換句話說，CRI將Container Runtime和容器服務給標準化，任何支援CRI的Container Runtime皆可以是Kubernetes的後端

## Container runtime that support CRI

* containerd
* docker
* cri-o

## PodSandbox

* Sandbox是容器的隔離的運行環境，在Kubernetes中也稱為 PodSandbox
* 當 Pod Sandbox 被建立之後，Kubelet就可以在裡面建立容器
* 當刪除Pod Sandbox時，Kubelet會先移除Pod Sandbox，再移除裡面的容器
* 根據後端的不同，他們可以有不同的實作方式，有可能是Container，也可能是虛擬機

## References

* [https://kubernetes.io/blog/2017/11/containerd-container-runtime-options-kubernetes/](https://kubernetes.io/blog/2017/11/containerd-container-runtime-options-kubernetes/)
* [https://kubernetes.io/blog/2016/12/container-runtime-interface-cri-in-kubernetes/](https://kubernetes.io/blog/2016/12/container-runtime-interface-cri-in-kubernetes/)