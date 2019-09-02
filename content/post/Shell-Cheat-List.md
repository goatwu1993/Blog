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

* {{< highlight bash >}}echo $SHELL{{</highlight >}}
  * Show shell name.
  * {{< highlight bash >}}$SHELL --version{{</highlight >}}
  * Show shell version.
* {{< highlight bash >}}clear{{</highlight >}}
  * Clear terminal.
* {{< highlight bash >}}history{{</highlight >}}
  * Show the commands history.
* {{< highlight bash >}}pwd{{</highlight >}}
  * Print working directory
* {{< highlight bash >}}ls{{</highlight >}}
  * List the files in working directory.
  * {{< highlight bash >}}ls -la{{</highlight >}}  
  * List all files, hidden file included, with detailed information.
* {{< highlight bash >}}chown{{</highlight>}}
  * Change ownership of a file.
  * {{< highlight bash >}}chown nobody.nogroup your_file_name{{</highlight>}}  
  * Change a ownership of a file.
  * {{< highlight bash >}}chown -R nobody.nogroup .{{</highlight>}}
  * Recursively change all file under this directory.
* {{< highlight bash >}}chmod{{</highlight>}}
  * Change the read/write permission of a file
  * {{< highlight bash >}}chmod 777 file_name{{</highlight>}} 
  * Make file r/w/e able for all user & group.

---

## Network

* {{< highlight bash >}}ifconfig{{</highlight>}}
  * Show network interface config/info.
* {{< highlight bash >}}netstat{{</highlight>}}
  * Show network status, include tcp/udp port.
* {{< highlight bash >}}brtcl{{</highlight>}}
  * Check the bridge Interface
  * {{< highlight bash >}}brctl addbr <name>{{</highlight>}}
* {{< highlight bash >}}ssh{{</highlight>}}
* {{< highlight bash >}}ssh-keygen{{</highlight>}}
  * Generate a new ssh-key. Usually used when attempt to ssh a address which has change device/remote host.
  * Use this when encounter error message: {{< highlight bash >}}WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!{{</highlight>}}
  * {{< highlight bash >}}ssh-keygen -R 192.168.1.254{{</highlight>}}
* {{< highlight bash >}}scp{{</highlight>}}

---

## Server

* {{< highlight bash >}}ps{{</highlight>}}
List all process.
* {{< highlight bash >}}kill $pid{{</highlight>}}
Kill a process
* {{< highlight bash >}}crontab{{</highlight>}}
  * List cronjib
  * {{< highlight bash >}}crontab -l{{</highlight>}}
  * List all cronjob.
* {{< highlight bash >}}top{{</highlight>}}
