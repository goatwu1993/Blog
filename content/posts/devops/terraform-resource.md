---
title: Terraform resource
date: 2021-03-21
draft: false
tags: [terraform]
slug: terraform-resource
summary: terraform-resource
---

## Provider Block

```terraform
resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = "westus2"
}
```

Resource是Terraform的主要區塊，定義了一個資源，上面定義了一個Azure的Resource Group。

## Import existing resources

如果資源的ID已經被使用，但沒有在Terraform中定義，要先使用Import

```bash
azurerm_resource_group.rg "myTFResourceGroup"
```
