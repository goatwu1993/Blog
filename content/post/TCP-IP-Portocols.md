---
title: "TCP/IP protocols"
date: 2018-05-11T11:29:21+08:00
draft: false
categories: [Networking]
tags: [Networking, Wireshark]
slug: TCP-IP-protocols
gitment: true
---

### HTTP
* Hyper Text Transport Protocol
* TCP Port 80

### HTTPS
* Hyper Text Transport Protocol Secure
* TCP Port 443

### FTP
* File Transfer Protocol
* TCP Port 21

### Telnet
* Telecommunication Protocol
* TCP Port 23

## SMTP
* Simple Mail Transfer Protocol
* TCP port 25
* For email

### DNS
* Domain Name System
* UDP Port 53
* Wireshark Filter
    * dns
    * udp.port == 53
* Some Famous public DNS Server  
    https://www.lifewire.com/free-and-public-dns-servers-2626062
* There are many attempt to user either TCP or more secure to protect DNS, however the speed is very critical, and all method will slow down the speed of loading page resource

### TFTP
* Trivial File Transfer Protocol
* UDP port 69
* Not secure. Should only be used in private net.

### Radius
* Remote Authentication Dial-In User Service
* UDP Port : 1812 (authentication) & 1813(accounting)  
* Wireshark Filter:  
    * radius  
    * udp.port == 1812  
    * udp.port == 1813  
* Code
    * Access-Request  
    * Access-Accept  
    * Access-Reject  
    * Access-Challenge  



