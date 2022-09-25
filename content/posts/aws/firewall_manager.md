---
title: Firewall Manager
date: 2022-09-25
draft: false
tags: [aws, waf]
slug: firewall-manager
summary: Firewall Manager
---

## What

Firewall Manager allow you to configure all security settings in all accounts under your organization.

## Common sets of security policies

1. WAF rules
1. AWS Shield Advanced
1. Security Groups
1. AWS Network Firewall (VPC Level)
1. AWS Route 53 Resolver DNS Firewall

Policies are creaeted at the region level. Rules are applied to new resources by default.

## Firewall Manager vs Shield vs WAF

1. Firewall Manager works together with Shield and WAF
1. Web ACL/Common Web Exploit/Injection -> WAF
1. DDoS/Fast 24/7 Response from AWS Team-> Shield
1. Centralize Configuration -> Firewall Manager
