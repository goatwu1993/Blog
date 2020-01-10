+++
title = "Apache Kafka - Part1"
date = 2020-01-09T19:53:34+08:00
draft = false
tags = ["scala", "BigData"]
slug = "apache-kafka-part1"
gitment = true
toc= true
categories = []
weight= 40
+++

## What is Kafka

### Kafka 是什麼

- Kafka 是一個流 /訊息處理平台(stream processing platform)，作為一個單一平台，可以處理 Real-Time 的資料流

### Kafka 特點

- 架構簡化
  - Producers 只需要傳送訊息給 topic，consumer 可以選擇任何 message system 來接收訊息。
  - Kafka 提供 pub-sub 及 queue based messaging system
  - Kafka 基於 commit log，使用者可以 subscribec 或 publish data 到多個系統或是 App
- 網路傳輸優化

  - 效率優化過的 binary TCP-based protocol
  - 記憶體緩衝機制，訊息會先寫入一個記憶體緩衝中，然後直到多條訊息組成了一個 Batch，才會一次網路通訊把 Batch 傳送過去，可以減少網路封包的 Overhead。

- I/O 優化

  - Kafka 可提供 2 million writes/sec
  - Kafka 將 data 保存在硬碟上，意味著寫入會經過 RAM，所以 data 傳送到 network socket 效率很高

- Zookeeper
  - Kafka 需要 ZooKeeper 提供同步服務
- API
  - Kafka 提供 Kafka Connect 連接外部系統(用於資料輸入/輸出)
  - Kafka 提供 Kafka Streams: 一個 java stream processing 庫，Java application that consume data from Kafka and write results back to Kafka.
  - Also works with external stream processing systems such as Apache Spark.

### Kafka 優點

- 分散式的 publish-subscribe 訊息系統加上可靠的 queue 讓 Kafka 能夠處理巨量的資料流

- Reliability 可靠性  
  Kafka is distributed, partitioned, replicated and fault tolerance.

- Scalability 可擴展性  
  Kafka 可以 Zero downtime 輕鬆擴展

- Durability 耐用性  
  Kafka 使用分散式 commit log，訊息會被盡快的寫到磁碟上。
- Performance  
  Kafka has high throughput for both publishing and subscribing messages. It maintains stable performance even many TB of messages are stored.
- zero downtime
- zero data loss

### Kafka Example applications

- managing passenger and driver matching at Uber
- providing real-time analytics and predictive maintenance for British Gas’ smart home,
- performing numerous real-time services across all of LinkedIn.
