---
title: VPC NACL
date: 2022-09-23
draft: false
tags: [aws, vpc]
slug: vpc nacl
summary: vpc nacl
---

## What is NACL

NACL stands for Network Access Control List. It is like a firewall which control traffic for and to subnets.

## Main Difference between NACL and SG

| Item      | Security Group          | NACL             |
| --------- | ----------------------- | ---------------- |
| level     | instance/eni            | subnet           |
| rule      | allow                   | allow/deny       |
| stateful  | stateful                | stateless        |
| evalution | all rules are evaluated | first match wins |

## NACL

A subnet can have one and only NACL. The default NACL is assigned if not specified.

Recommendation is that do not change the default NACL(since if may be applied on existing/new subnets by default).

Instead create a NACL and apply to the desired subnet.

## NACL Rule

1. Rule have a number (1-32766)
1. Rule first match wins.

AWS recommend to add rule number by 100

## Ephemeral Ports

Ports that auto opened and assigned when client accessing outbound to accept response packages.

Ephemeral Port Range:

1. Linux: 32768 - 60999
1. Windows: 49152 - 65535

Union: 32768 - 65535
