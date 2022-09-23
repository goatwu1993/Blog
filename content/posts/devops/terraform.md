---
title: Terraform
date: 2021-03-21
draft: false
tags: [terraform]
slug: terraform
summary: cri
---

## What is Terraform

> Terraform is a tool for building, changing, and versioning infrastructure safely and efficiently. Terraform can manage existing and popular service providers as well as custom in-house solutions.

Terraform 是一個開源的 **Infrastructure as Code** 工具. 由 HashiCorp 主導.

## What is Providers

> Providers are a logical abstraction of an upstream API. They are responsible for understanding API interactions and exposing resources.

一個Provider會提供某個雲端服務的Infrastructure as Code實作，當你需要使用整合不同的雲端時，只需要引入新的Provider，就可以在不同的設施之間進行整合。

HashiCorp官方透過和各家廠商合作，支援

1. AWS
1. GCP
1. Azure
1. Kubernetes

等等Providers

## Why Terraform

Terraform允許工程師以程式碼(**HCL** or **JSON**)定義設施，這讓管理、新增、更改以及刪除設施更有安全、有效率

## References

- [https://www.terraform.io/intro/index.html](https://www.terraform.io/intro/index.html)
- [https://registry.terraform.io/browse/providers](https://registry.terraform.io/browse/providers)
