---
title: Terraform terraform
date: 2021-03-21
draft: false
tags: [terraform]
slug: terraform-terraform
summary: terraform-terraform
---

## Terraform Block

```terraform
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }
}
```

Terraform Block定義了

1. Provider
1. Provider Registry
1. 版本(選填)
