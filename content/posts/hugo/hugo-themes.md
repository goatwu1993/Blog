---
title: "Hugo themes"
date: 2019-12-27T21:32:52+08:00
draft: false
tags: [hugo, git]
categories: [hugo]
slug: hugo-themes
gitment: true
---

本篇記錄如何使用 hugo 線上的 themes

## Hugo themes

[Hugo 官方線上 themes](https://themes.gohugo.io/)

### a. 直接 submodule

不考慮更改 themes 的 partial/layout/css 的話，直接照抄就好

```bash
# submodule
cd ./themes
git submodule add https://github.com/avianto/hugo-kiera.git kiera
```

### b. fork 再 submodule

如果需要更改 partial/layout/css 的話請選擇 fork

```bash
# fork
cd ./themes
git clone https://github.com/$你的Id/hugo-kiera.git kiera
```

## 修改 config.toml

```bash
theme = "kiera"
```
