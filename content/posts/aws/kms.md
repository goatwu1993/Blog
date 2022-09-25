---
title: KMS
date: 2022-09-23
draft: false
tags: [aws, kms]
slug: kms
summary: kms
---

## What

KMS stands for Key Management Service

## Some Info

1. Able to audit key use in cloudtrail
1. Charged by API call and management fee.

## Key Type

1. Manager
   1. AWS Managed Keys -> AWS Managed, Free
   1. Customer Managed Keys -> Customer Managed, \$1 per month
   1. Customer Managed Keys Imported -> Customer Managed, \$1 per month
1. Encyption
1. Symmetrc (AES-256)
1. Asymmtric (RSA/ECC)

## Key Policy

1. Specify who can access the keys. Useful for cross account architecture.

## Auto Rotation

1. AWS managed keys always have auto rotate on, with 1 year interval
1. Customer managed keys has to open auto rotation manually, with 1 year interval
1. Customer Imported Keys/CloudHSM cannot auto rotate.
