---
title: "Apache Kafka - Part1"
date: 2020-01-09T19:53:34+08:00
draft: false
tags: ["Hadoop", "Kafka", "BigData"]
slug: "kafka-p1"
# summary
summary: What is Apache Kafka
# other configs
diagram: true
toc: true
weight: 40
---

## What is Kafka

Kafka 是一個資料流 /訊息處理平台(message/stream processing platform)，仲介處理端到端 Real-Time 的訊息傳輸。

### Kafka 特點

- 提供 pub-sub 及 point-to-point 兩種 queue mode

- 優化過的 binary TCP-based protocol 及記憶體緩衝機制，多條訊息會先寫入記憶體緩衝中存成 Batcch 一同傳輸，可以減少網路封包的 Overhead。

- 對資料的包裝是輕量級的，且可壓縮。避免掉不必要的物件包覆，可以直接以檔案的型式來處理資料。

- 因為可以直接處理檔案資料，直接用 OS 的 page cache，不需要額外 Applicaion Cache 來競爭珍貴的記憶體空間。

## Kafka 優點

### Reliability 可靠

Kafka is distributed, partitioned, replicated and fault tolerance.

### Scalability 可擴展性

Kafka 為分散式架構，可以 Zero downtime 輕鬆擴展

### Durability 耐用性

Kafka 使用分散式 commit log，訊息會被盡快的寫到磁碟上。

### Performance

Publish/subscribe 皆可以提供很高的 throughput

### Decoupling

Producer/Consumer 只需要對 Topics 傳送訊息，可以降低系統間的耦合度。

### Fault Tolerance

Partition 的 replicating 容許些許 Broker 離線時服務仍正常運作。

### Zero downtime

### Zero data loss

## Kafka Example applications

- managing passenger and driver matching at Uber
- providing real-time analytics and predictive maintenance for British Gas’ smart home,
- performing numerous real-time services across all of LinkedIn.
