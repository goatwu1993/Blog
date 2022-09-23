---
title: CRI-O
date: 2021-03-07
draft: false
tags: [container, kubernetes]
slug: cri-o
summary: cri
---

## What

cri-o是一個container engine(frontend)，由Redhat領導

## Why

> CRI-O is an implementation of the Kubernetes CRI (Container Runtime Interface) to enable using OCI (Open Container Initiative) compatible runtimes. It is a light
> CRI-O 是實作 Kubernetes CRI的container engine，讓Kubernetes可以使用任何符合OCI介面的container runtime，目前主要支援

1. kata container
1. runc

但理論上，任何符合OCI的Container Runtime都可以支援。

簡單的說，CRI-O 是

1. Redhat領導的
1. Kubernetes優先的

一個CRI container engine實作

## More About

CRI-O是由多個開源的軟體來組成的，包含

1. OCI compatible runtime
1. containers/storage
1. containers/image
1. networking (CNI)
1. container monitoring (conmon)

## References

- [https://cri-o.io/](https://cri-o.io/)
