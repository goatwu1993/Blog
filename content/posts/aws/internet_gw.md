---
title: Internet Gateway
date: 2022-09-23
draft: false
tags: [aws, vpc]
slug: internet-gw
summary: internet gateway
---

## What

Internet Gateway allow resources in VPC to access internet

## Info

1. Internet Gateway scales horizontally
1. Internet Gateway is HA and redundant
1. Must be create superately from a VPC
1. 1 VPC can attach to 1 Internet Gateway and vice versa (one to one)
1. Must configure route table to works as expected.
