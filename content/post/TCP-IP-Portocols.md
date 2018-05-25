---
title: "TCP/IP protocols"
date: 2018-05-11T11:29:21+08:00
draft: false
categories: [Networking]
tags: [Networking, Wireshark]
slug: TCP-IP-protocols
gitment: true
---

### Radius

* Protocol : UDP  
* Default Port : 1812 (authentication) & 1813(accounting)  
* Wireshark Filter:  
    * radius  
    * udp.port == 1812  
    * udp.port == 1813  
* Code
    * Access-Request  
    * Access-Accept  
    * Access-Reject  
    * Access-Challenge  

### DNS
* Protocol : Usually UDP
* Default Port : 53
* Wireshark Filter
    * dns
    * udp.port == 53
* Some Famous public DNS Server  
    https://www.lifewire.com/free-and-public-dns-servers-2626062
