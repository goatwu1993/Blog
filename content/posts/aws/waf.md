---
title: WAF
date: 2022-09-23
draft: false
tags: [aws, waf]
slug: waf
summary: waf
---

## What

WAF stands for web application firewall

## Can be deployed on

1. Application Load Balancer
1. API Gateway
1. CloudFront
1. AppSync GraphQL API
1. Cognito User Pool

## Web ACL

Web ACL rules can filter

1. IP Set: Up to 10,000 IP addresses
1. HTTP Headers
1. HTTP Body
1. HTTP query string
1. Geo Match
1. Rate Based

Protect From

1. SQL Injection
1. XSS
1. Size Contraint
1. DDoS

Web ACL is regional except from CloudFront

## Web ACL Rule Group

A reusable group of Web ACL rules

## Web ACL with fixed IP

To fix IP, you can use a Global Accelerator.
