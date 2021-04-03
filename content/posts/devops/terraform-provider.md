---
title: "Terraform provider"
date: 2021-03-21
draft: false
tags: [terraform]
slug: "terraform-provider"
summary: terraform-provider
---

## Provider Block

```terraform
provider "azurerm" {
  features {}
}
```

這個Block設定了Provider，由於沒有宣告Alias，因此Alias為default。

## Alias

當你需要不同設定的同一種Provider，可以使用Alias

同種Provider的第一個，可以不宣告Alias，如果Resource沒有宣告Provider則會使用default的設定。

```terraform
# The default provider configuration; resources that begin with `azurerm_` will use
# it as the default, and it can be referenced as `azure_rm
provider "azurerm" {
  features {}
}

# reference this as `azure_rm.sub_2`.
provider "azurerm" {
  alias  = "sub_2"
  features {}
  subscription_id = "xxx"
}

# To create a resource group under default subscription
resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = "westus2"
}

# To create a resource group under subscription2
resource "azurerm_resource_group" "rg" {
  provider = azure_rm.sub_2
  name     = "myTFResourceGroup"
  location = "westus2"
}
```
