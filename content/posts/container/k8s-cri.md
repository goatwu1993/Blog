---
title: cri
date: 2021-03-07
draft: false
tags: [container, kubernetes]
slug: cri
summary: cri
---

## What is CRI?

CRI 是一個kubernetes提供的一個**grpc**介面，用來和Container runtime溝通

## Why

- CRI允許kubernetes以單一標準和多種Container Runtime溝通，這意味著Kubernetes可以運行在多種Container Runtime之上，而不需要重新編譯
- 標準化kubernetes和Container Runtime的溝通，Kubernetes可以使用任何支援CRI的Container Runtime
- 由於接口標準化，kubernetes可以專注在開發kubelet的應用以及邏輯

## Container runtime that support CRI

- containerd
- docker
- cri-o

## PodSandbox

- Sandbox是容器的隔離的運行環境，在Kubernetes中也稱為 PodSandbox
- 當 Pod Sandbox 被建立之後，Kubelet就可以在裡面建立容器
- 當刪除Pod Sandbox時，Kubelet會先移除Pod Sandbox，再移除裡面的容器
- 根據後端的不同，他們可以有不同的實作方式，有可能是Container，也可能是虛擬機

## 比較知名的CRI實作

1. containerd (lead by docker)
1. cri-o (lead by Redhat)

## References

- [https://kubernetes.io/blog/2017/11/containerd-container-runtime-options-kubernetes/](https://kubernetes.io/blog/2017/11/containerd-container-runtime-options-kubernetes/)
- [https://kubernetes.io/blog/2016/12/container-runtime-interface-cri-in-kubernetes/](https://kubernetes.io/blog/2016/12/container-runtime-interface-cri-in-kubernetes/)
