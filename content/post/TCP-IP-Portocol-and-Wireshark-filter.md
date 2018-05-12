---
title: "TCP/IP protocol & Wireshark Filter"
date: 2018-05-11T11:29:21+08:00
draft: false
categories: [Networking]
tags: [Networking, Wireshark]
slug: TCP-IP-Portocol-and-Wireshark-filter
gitment: true
---

### Radius

* Protocol : UDP  
* Default Port : 1812 (authentication) & 1813(accounting)  
* Wireshark Filter:  
    * radius  
    * udp.port == 1812 || udp.port == 1813  
  
* Protocol : DNS  
* Default Port : 