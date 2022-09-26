---
title: Linux File System
date: 2022-09-26
draft: false
tags: [fs]
slug: fs
summary: linux file system
---

## Sector (磁區)

磁碟本身最小的單位是Sector

## Block (塊)

Block為類Unix系統在讀寫時的最小單位，是由八個sector(磁區)組成的4k位元組的block(塊)。

## Formatting (格式化)

檔案系統在格式化的時候，就會把儲存區域分成兩大連續的儲存區域。

一個用來儲存檔案系統的metadata，這是由inode組成的表，每個inode預設是256個位元組
格式化時另一個儲存區域，用來儲存檔案系統物件的內容資料。

## inode

inode 是描述一個檔案的metadata的資料結構，每個inode是由256/128個位元組組成

典型的實現下，所有inode佔檔案系統1%的儲存空間。

每個檔案對應一個inode，並用一個整數來辨識，這個整數被成為inumber/inode number

inode儲存了檔案系統物件的metadata，如

1. 所有者
1. 存取權限
1. 類型(檔案/目錄)
1. 創建時間
1. 內容修改時間
1. inode修改時間
1. 上次存取時間

兩個檔案的inode相同，則兩個檔案互為硬連結。

## Stat

```bash
bash-4.1$ stat -x tmp.txt
  File: "tmp.txt"
  Size: 11108523     FileType: Regular File
  Mode: (0644/-rw-r--r--)         Uid: (  502/peter_wu)  Gid: (   20/   staff)
Device: 1,5   Inode: 106433545    Links: 1
Access: Tue Aug 30 19:10:58 2022
Modify: Tue Aug 30 19:10:55 2022
Change: Tue Aug 30 19:10:55 2022
 Birth: Tue Aug 30 19:10:55 2022
```

## Check System Inode Usage

```bash
bash-5.1$ df -ih
Filesystem       Size   Used  Avail Capacity iused      ifree %iused  Mounted on
/dev/disk1s1s1  466Gi   14Gi  216Gi     7%  502048 2260109880    0%   /
devfs           193Ki  193Ki    0Bi   100%     666          0  100%   /dev
/dev/disk1s5    466Gi  5.0Gi  216Gi     3%       5 2260109880    0%   /System/Volumes/VM
/dev/disk1s3    466Gi  767Mi  216Gi     1%    3363 2260109880    0%   /System/Volumes/Preboot
/dev/disk1s6    466Gi   10Mi  216Gi     1%      16 2260109880    0%   /System/Volumes/Update
/dev/disk1s2    466Gi  229Gi  216Gi    52% 2426594 2260109880    0%   /System/Volumes/Data
map auto_home     0Bi    0Bi    0Bi   100%       0          0  100%   /System/Volumes/Data/home
```

## Check System Inode Usage

```bash
for i in /*; do echo $i; find $i |wc -l; done
```
