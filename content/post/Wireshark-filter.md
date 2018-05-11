---
title: "TCP/IP protocal & Wireshark Filter"
date: 2018-05-11T11:29:21+08:00
draft: false
categories: [Networking]
tags: [Networking, Wireshark]
slug: Wireshark-Filter
gitment: true
---

### Radius

* Protocol : UDP  
* Default Port: 1812 & 1813  
* Wireshark Filter:  
    * radius  
    * udp.port == 1812 || udp.port == 1813  