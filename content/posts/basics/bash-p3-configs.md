---
title: "Bash P3 Configs"
date: 2020-01-19T22:12:33+08:00
draft: false
diagram: true
tags: ["Shell", "Bash"]
slug: "Bash-P3-Configs"
toc: true
categories: []
weight: 40
---

## profile file

- Read by login shell
- .profile is read by many shells in the absence of their own shell-specific config files.

## bash_profile

- Readby login shell(Bash)

## bashrc

- Subshells read only .bashrc.
- Shell script 開頭

  ```bash
  #!/bin/bash
  ```

  會讀取 bashrc 相關變數

## Login shell

- 使用 su 切換使用者

## Subshell

- screen
- tmux

```mermaid
graph TD
    subgraph Login Shell
        subgraph System configs
        A("/etc/profile") --> B("/etc/bash_profile")
        end
        subgraph User configs
        B --> C("~/.profile")
        C --> D("~/.bash_profile")
        end
    end
    subgraph Subscreen
        D -.-> E("~/.bashrc")
    end
```

## Reference

- <https://serverfault.com/questions/261802/what-are-the-functional-differences-between-profile-bash-profile-and-bashrc>
