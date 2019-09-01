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

* `echo $SHELL`
  * Show the current shell.
  * `echo $SHELL` to show the current shell.
  * `$SHELL --version` to show the current shell with version.
* `clear`
  * Clear terminal.
* `history`
  * Show the commands history.
* `pwd`
  * Print working directory
* `ls`
  * List the files in working directory.
  * `ls -la` to list all files, hidden file included.
* `chown`
  * Change ownership of a file.
  * `chown nobody.nogroup your_file_name` to change a ownership of a file.
  * `chown -R nobody.nogroup .` to recursively change all file under this directory.
* `chmod`
  * Change the read/write permission of a file
  * `chmod 777 your_file_name` to let all group and user read/write your file.

---

## Network

* `ifconfig`
  * Show network interface configuration
* `netstat`
  * Show network status, include tcp/udp port.
* `brtcl`
  * Check the bridge Interface
  * `brctl addbr <name>`
* `ssh`
* `ssh-keygen`
  * Generate a new ssh-key. Usually used when attempt to ssh a address which has change device/remote host.
  * Error message: `WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!`
  * `ssh-keygen -R 192.168.1.254`
* `scp`
  * Use ssh to cp a file to remoter server
  * `scp /local_path/locol_file_name remote_account@remote_server_address:/remote_server_path/remoter_server_file_name`

---

## Server

* `ps`  
List all process.
* `kill`  
Kill a process
* `crontab`  
  * List cronjib
  * `crontab -l` to list all cronjob.
* `top`
