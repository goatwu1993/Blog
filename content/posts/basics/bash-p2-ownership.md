---
title: "Bash - ownership"
date: 2020-01-19T22:11:15+08:00
draft: true
diagram: false
tags: [shell, bash]
slug: "bash-p2-ownership"
toc: false
categories: []
weight: 40
---

```bash
umask

# Change ownership of a file.
chown
# Change an ownership of a file.
chown nobody.nogroup your_file_name
# Recursively change all file under this directory.
chown -R nobody.nogroup .

# Change the read/write permission of a file
chmod
# Make file r/w/e able for all user & group.
chmod 777 file_name

```

## Referencce
