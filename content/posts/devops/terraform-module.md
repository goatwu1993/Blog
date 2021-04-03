---
title: "Terraform module"
date: 2021-03-21
draft: false
tags: [terraform]
slug: "terraform-module"
summary: terraform-module
---

## Module

```terraform
module "aks" {
  source              = "Azure/aks/azurerm"
  resource_group_name = azurerm_resource_group.example.name
  prefix              = "prefix"
}
```

module是包含了許多的resource的block

## Import existing modules

如果資源的ID已經被使用，但沒有在Terraform中定義，要先使用Import

```bash
azurerm_module_group.rg "myTFmoduleGroup"
```
