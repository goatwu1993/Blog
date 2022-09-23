---
title: VPC
date: 2022-09-23
draft: false
tags: [aws, vpc]
slug: vpc
summary: vpc
---

## What

VPC stands for Virtual private cloud. A default vpc is created for each account created.

Each VPC belongs to a region

## Some Info

1. Soft limit is 5 vpc for each account per region.(increasable)
1. Max CIDR per VPC is 5.
1. Each CIDR can have a max size of /16 and min size of /28
1. Only private CIDR is allowed.
1. VPC CIDR should not overlap with your other VPC

## Tenancy

1. Default -> shared hardware
1. Dedicated -> dedicated hardware (Expensive)

## Other Items that comes with VPC

1. NACL
1. DHCP Options Set
