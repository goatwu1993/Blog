---
title: "CRI-O"
date: 2021-03-07
draft: false
tags: [container, kubernetes]
slug: "CRI-O"
summary: cri
---

## What is CRI-O

官網介紹

> CRI-O is an implementation of the Kubernetes CRI (Container Runtime Interface) to enable using OCI (Open Container Initiative) compatible runtimes. It is a light
CRI-O 是實作 Kubernetes CRI的軟體，讓Kubernetes可以使用任何符合OCI介面的container runtime，目前主要支援

1. kata container
2. runc

但理論上，任何符合OCI的Container Runtime都可以支援。
Kubernetes有了CRI-O，基本可以使用任何OCI格式的Container Runtime

簡單地說：CRI-O 是界接 Kubernetes 以及任何 OCI Container Runtime 的橋樑

## More About

CRI-O是由多個開源的軟體來組成的，包含

1. OCI compatible runtime
1. containers/storage
1. containers/image
1. networking (CNI)
1. container monitoring (conmon)

## References

* [https://cri-o.io/](https://cri-o.io/)