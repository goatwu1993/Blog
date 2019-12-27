---
title: "Hugo Cheatlist"
date: 2019-12-27T21:32:52+08:00
draft: false
tags: [hugo]
categories: [hugo]
slug: hugo-cheatlist
gitment: true
---

## Hugo 使用

### 安裝

```bash
brew install hugo
```

### 第一次使用

```bash
hugo new site quickstart
```

### 測試

```bash
#!/bin/bash
cd quickstart
hugo
hugo server
```

### 部署

這邊有個小坑，content 寫好 markdown，指令下 hugo 不會自動覆蓋到最終的資料夾裡面，需要手動刪除再跑一次 hugo 。

```bash
rm -rf ./docs
hugo
```

### 新增文章

```bash
hugo new posts/my-first-post.md
```

### 參考資料

- [Hugo 官網](https://gohugo.io/getting-started/quick-start/)
