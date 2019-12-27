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

## 下載 themes

到他們的 github 上面，有兩種方式

### 方案 a. submodule

完全不動到 themes 裡面的話可以用 submodule。

```bash
# submodule
cd ./themes
git submodule add https://github.com/avianto/hugo-kiera.git kiera
```

### 方案 b. fork

適合你覺得下載 themes 之後會想要更改的情形。

```bash
# fork
cd ./themes
git clone https://github.com/$你的Id/hugo-kiera.git kiera
```

## 修改 config.toml

```bash
theme = "kiera"
```
