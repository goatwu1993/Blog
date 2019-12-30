---
title: "macOS configs - vim"
date: 2018-05-06T04:51:07+08:00
draft: false
categories: [shell, macos]
tags: [linux, macos, vim, shell]
slug: setting-macos-vim
gitment: true
toc: true
---

## \*rc 檔

- 當一支程式跑起來，會去讀設定擋以更改設定
- rc 檔案就是的設定檔，儲存字體、顏色等，Linux 的 command line 程式，大部分都以 rc 結尾，rc = run commands
- 常見的 rc
  - bashrc
  - vimrc
  - zshrc
- 根據程式不同， rc 檔會在不同的位置，不同的名字，但大部分為以下兩個

* ~/.{program_name}rc
* ~/.{program_name}/{program_name}rc

## vimrc

打開 Mac terminal 輸入

```bash
# check vim version
vim --version
# open vim
vim
```

打開 vim

```vim
:help vimrc
```

可以看到 vimrc 的相關介紹

### 自己設定

根據 vim 的說明，各使用者應該分別在 \$HOME (~) 設定 vimrc。
。

```bash
mkdir ~/.vim
cd ~/.vim
vim vimrc
```

最後直接參考大神

https://github.com/amix/vimrc
