---
title: "My Vim config"
date: 2018-05-06T04:51:07+08:00
draft: false
categories: [Shell]
tags: [Linux, MacOS, Vim, Shell]
slug: Setting-macOS-Vim
gitment: true
---

# My Vim config

## What is vimrc

- Recently, a friend of mine bought a Macbook. He though it would be cool to use vim, which allows edit files in terminals, even though I know he is going to use MS word few days later.

- vimrc is the config of vim. Each time one open vim, vim will load the settings written in vimrc. As a result, a nice vimrc leads to a more easy-to-use vim settings.
- In Mac terminal, you can check vim version:  
  `$ vim --version`‌
- `$ vim`  
  In vim terminal type:  
  `:help vimrc`  
  There is more informations and recommendation about what vimrc.

## Setting up vimrc

- `:help vimrc`  
  It recommended one should use user directory (~) instead if root directory (/) in order to avoid messed-up.
- Back to terminal

```bash
mkdir ~/.vim
cd ~/.vim
vim vimrc
```

- Edit(or paste) in vim

  ```bash
  syntax on
  set nu
  set ruler
  set ic
  set hlsearch
  ```

- Save file and quit.

## Multiple Macs

- In case you are rich and have multiple Macs with same iCloud account, you can also place your vimrc (and other settings) at iCloud syncronized `~/Desktop` to get vimrc synced.  
  `ln -s ~/Desktop/Config/VIM/.vim ~/.vim`
