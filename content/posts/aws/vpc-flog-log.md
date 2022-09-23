---
title: VPC Flow Log
date: 2022-09-23
draft: false
tags: [aws, vpc]
slug: vpc flow log
summary: vpc flow log
---

## What

VPC Flow log is to log the traffic within your network

## Some Info

### Log Level

1. VPC
1. Subnet
1. ENI

### Log Info

1. src/dst addr
1. src/dst port
1. action (success/failure)

### Log Destination

1. CloudWatch
1. S3 Bucket

### Visibility/Dashboard

1. Log Insight (CloudWatch)
1. Athena (S3)

### Some Debug Tips

1. Outbound/Inbound failure -> NACL or SG
1. Outbound/Inbound success but return error -> NACL (SG auto allow the return package)
