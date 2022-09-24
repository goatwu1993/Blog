---
title: VPC Endpoints
date: 2022-09-23
draft: false
tags: [aws, vpc]
slug: vpc-endpoints
summary: vpc-endpoints
---

## What

VPC Endpoints allow you to access AWS Services without going through Internet Gateway.

## Some Info

1. Powered by AWS Private Link.
1. Redundant and scales horizontally.
1. Needs to configure DNS/Routable/NACL/SG
1. Charged per hour + traffic

## Interface Endpoints

Every single services

## Gateway Endpoints

1. S3
1. Dynamodb

Need to modify the route table. No need to change DNS settings.
Gateway is prefered overed interface.
