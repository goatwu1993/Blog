---
title: "Bash Shell Script"
date: 2018-06-10T17:20:14+08:00
draft: true
categories: [Linux]
tags: [Linux]
slug: Bash-Shell-Script
gitment: true
---

# General
## clear
* Clear your terminal

## history
* show the history of commmand used.

## ls
* List the file in the directory you're at
* e.g. `ls -la` to list all file, including hidden file, which file name start with `.`.

## echo $SHELL
* Show the current SHELL using. 
* e.g. `echo $SHELL.` to show the current shell.
* e.g.`$SHELL --version` to show the current shell with version. 

## chown
* Change ownership of a file. 
* e.g. `chown nobody.nogroup your_file_name` to change a ownership of a file. 
* e.g. `chown -R nobody.nogroup . ` to recursively change all file under this directory. 

## chmod
* Change the read/write permission of a file
* e.g. `chmod 777 your_file_name` to let all group and user read/write your file.

---

# Network
## brtcl
* Check the bridge Interface
* brctl addbr <name> 

## ssh
* ssh

## ssh-keygen
* Generate a new ssh-key. Usually used when attempt to ssh a address which has change device/remote host.
* When `WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!` appears when attempt to `ssh` , then typing this command may work. 
* e.g. `ssh-keygen -R 192.168.1.254`

## scp
* use ssh to cp a file to remoter server
* e.g. `scp /local_path/locol_file_name remote_account@remote_server_address:/remote_server_path/remoter_server_file_name`

---

# Console
## screen
* go to /dev and find interface
* screen "tty.XXXX" %buadrate.  
* e.g. `screen /dev/tty.usbserial-AL03M23E 115200`

---

# Server
## ps
* List all process

## kill
* Kill a process 

## crontab
* List cronjib
* e.g. `crontab -l` to list all cronjob

## top

