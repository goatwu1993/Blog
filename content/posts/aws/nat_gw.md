---
title: NAT Gateway
date: 2022-09-23
draft: false
tags: [aws, vpc]
slug: nat-gateway
summary: NAT Gateway
---

## What

NAT Gateway is AWS managed NAT

## Some Info

1. HA
1. Pay per hour and bandwidth
1. 1 NAT Gateway lives within 1 subnet. ( Internet geteway is created in VPC)
1. NAT Gateways should be created within public subnets to leverage the public route tables.
