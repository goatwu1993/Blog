---
title: "Bash commands"
date: 2018-06-10T17:20:14+08:00
draft: false
categories: [shell]
tags: [shell, bash, commands]
slug: bash-cheatsheet
---

## Greatest command of all time

```bash
#!/bin/bash

# manual
man anything
info anything
anything --help
```

## General commands

### Getting information

```bash
#!/bin/bash

# Show shell name.
echo $SHELL
echo $0
# Show shell version.
$SHELL --version

# Clear terminal.
clear

# Show command history.
history

# Print working directory
pwd

# Show system info
uname -a

# uptime
uptime
```

### File managing

```bash
#!/bin/bash

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

# get public ip
curl icanhazip.com

# Show network status
netstat
# Show all, include tcp/udp port.
netstat -an
# Show established connection
netstat -antu | grep 'ESTABLISHED'
# Show kernel routing information
netstat -r
netstat -tulnp

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

### Check and monitor process

```bash
#!/bin/bash

# List all process run by user shell
ps
# List all process, even by status
ps aux
# pstree
pstree

# Monitor the process status
top
# cpu
top -o cpu
# memery
top -o rsize

# List cronjob
crontab
# List all cronjob.
crontab -l
```

### Sending signal or kill process

```bash
#!/bin/bash

# Send a signal to a process
kill -signal PID
# Send 15 SIGTERM to a process
kill $pid

# killall allow you to kill app with name instead of pid
killall -9 $processname
# Ask before terminate
killall -i -9 $processname
```

### Memory usage

```bash
#!/bin/bash

# Show recent memory usage
free -m

```

## 參考資料

- [geekflare](https://geekflare.com/netstat/)
- [鳥哥第十六章、程序管理與 SELinux 初探](http://linux.vbird.org/linux_basic/0440processcontrol.php#ps_l)
