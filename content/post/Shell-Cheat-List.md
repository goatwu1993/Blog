---
title: "Shell Cheat List"
date: 2018-06-10T17:20:14+08:00
draft: false
categories: [Shell]
tags: [Shell]
slug: Shell-Cheat-List
gitment: true
---

# Shell Cheat List

## General

```bash
#!/bin/bash

# Show shell name.
echo \$SHELL
# Show shell version.
$SHELL --version

# Clear terminal.
clear


# Show the commands history.
history

# Print working directory
pwd

# List the files in working directory.
ls
# List all files, hidden file included, with detailed information.
ls -la

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

---

## Network

```bash
#!/bin/bash
# Show network interface config/info.
ifconfig

# Show network status, include tcp/udp port.
netstat

# Check the bridge Interface
brtcl
brctl addbr <name>

# ssh
ssh
# Generate a new ssh-key. Usually used when attempt to ssh a address which has change device/remote host. Use this when encounter error message: WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!
ssh-keygen

# scp
scp
```

---

## CPU, memery, task & process

```bash
#!/bin/bash
# List all process.
ps

# Kill a process
kill $pid

# List cronjob
crontab
# List all cronjob.
crontab -l

top
```
