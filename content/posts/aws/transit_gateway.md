---
title: Transit Gateway
date: 2022-09-24
draft: false
tags: [aws, vpc]
slug: transit-gateway
summary: transit gateway
---

## What

Transit Gateway is a centralize gateway to connect vpc, on prem(via vpn) and direct connect.

## Some Info

1. Regional resoures, can work cross region.
1. Can peer transit gateway across regions.
1. Works with VPN connections
1. Works with Direct Connect Gateway
1. Support IP Multicast

## Transit Gateway route table

Transit gateway route table can limit which vpc can connect to the other.

## ECMP

ECMP stands for Equal Cost Multi Path Routing. This tech can be use to increase VPN/On-Prem site bandwidth.
