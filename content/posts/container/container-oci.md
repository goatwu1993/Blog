---
title: "OCI"
date: 2021-03-07
draft: false
tags: [container]
slug: "oci"
summary: oci
---

## What

OCI是一個標準，訂定了container的

* Runtime 標準 (start, exec, pause)
* Image 標準
* Distribution 標準

## Why

> The mission of the Open Container Initiative (OCI) is to promote a set of common, minimal, open standards and specifications around container technology.

OCI的出現，確保container的開發者可以專注在開發服務，不會因為

1. client
1. 應用端App stack
1. Container Technology Vender
1. CPU, hardware, OS

等等的不同，而需要使用不同的Container技術

## OCI Runtime 的實作

[runtime-spec/implementations.md](https://github.com/opencontainers/runtime-spec/blob/master/implementations.md)

比較有名的是

1. runc (go, lead by docker)
2. crun (c, lead by Redhat)

## Ref

1. [https://github.com/opencontainers](https://github.com/opencontainers)
1. [https://opencontainers.org/faq/](https://opencontainers.org/faq/)
1. [https://www.capitalone.com/tech/cloud/container-runtime/](https://www.capitalone.com/tech/cloud/container-runtime/)