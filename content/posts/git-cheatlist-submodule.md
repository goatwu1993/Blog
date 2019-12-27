---
title: "Git Cheatlist"
date: 2019-12-27T21:32:52+08:00
draft: false
tags: [git]
categories: [git]
slug: git-cheatlist-submodule
gitment: true
---

## 新增 submodule

```bash
git submodule add git@github.com:xxx dir_name
```

## 移除 submodule

```bash
git rm --cached [欲移除的目錄]
rm -rf [欲移除的目錄]
```

## 再修改 .gitmodules

```
vim .gitmodules
```

## 再修改 .git/config

```
vim .git/config
```

最後再 commit，改變整個 Repository。

```bash
$ git add .gitmodules
$ git commit -m "Remove a submodule"
```

## 安全起見再做個 sync

```bash
git submodule sync
```

### 參考資料

- [網站一](https://biang.io/blog/development/tools/revision-control/git/submod)
