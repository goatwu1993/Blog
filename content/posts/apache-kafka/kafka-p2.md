---
title: "Apache Kafka - Part2"
date: 2020-01-09T19:53:34+08:00
draft: false
tags: ["Hadoop", "Kafka", "BigData"]
slug: "kafka-2"
weight: 40
---

## Kafka Architecture

![This is an image](https://upload.wikimedia.org/wikipedia/commons/thumb/6/64/Overview_of_Apache_Kafka.svg/1920px-Overview_of_Apache_Kafka.svg.png)
Picture from wiki

## Producers

- Producers 將發送資料流到一至多個 Topics

- Producer 使用 push(推)模式將訊息釋出到 Broker

- 實作 Kafka 提供的 Producer API

## Consumers

- Consumers 會訂閱一或多個 Topics

- Consumer 使用 pull(拉)模式從 Broker 訂閱並消費訊息

- 實作 Kafka 提供的 Consumer API

## Consumer Group

- 每個 Consumer 屬於一個特定的 Consumer Group

- 一則訊息可以發送到多個不同的 Consumer Group，但只能有一個 Consumer 消化該訊息

## Brokers

- 仲介處理 Consumer 以及 Producers 的訊息

- 訊息會被分到不同的抽象類別，這種抽象類別稱為 Topic

- 一個 Topic 又被分為多個 Partition，Partition 物理意義上為磁碟的一塊連續區域，但 Topics 的每個 Partition 通常會在不同的節點上

- 一個 Partition 可能又會有多個副本，副本也分散在不同的節點

- 通常要求 Topics 的 Partition 的數量超過 Broker 的數量，否則達不到 Load distribution 的效果

- Broker 是 Stateless 的

### Broker controller

其中一個 Broker 會被推選為 Controller，Controller 會負責偵測 Broker 級別的 Failure，並幫忙所有受影響的 Partition 更換 Partition leader

## Topics

- ### Topics 定義

  - Topics 為訊息的抽象分類
  - Producers 將發送資料流到一至多個 Topics，Consumers 則會訂閱一或多個 Topics
  - Topic 根據設定分為多個 Partitions(最少一個)
  - Topic 的 Partitions 通常分佈在不同的 Broker 節點
  - Topics 分為 Regular Topics 及 Compacted topics

- ### Regular Topics

  - 可以被設定一定的留存時間，若超國時間則 Kafka 可以刪除就資料已釋出硬碟空間，Default 留存時間為 7 天

- ### Compacted topics

  - 沒有有效期限
  - 新訊息若 Key 重複，則會覆蓋舊的鍵值對
  - Producer 可發送值為 null 的鍵值對以永久刪除該資料，稱作 tombstone message

## Partitions

- ### Partitions 定義

  - 一個 Topic 可以被分為多個 partitions(最少一個)，通常會設定多個 Partition 以處理任意大小的資料
  - Partition 是一個 Queue 的實作，訊息在裡面依據 index/offset 排序，順序不可變動
  - Partition 物理上是磁碟的連續區域，新訊息會被 append 到 partition 尾端，由於是順序寫磁碟，因此效率非常高

- ### Partition offset

  - Message 在 partition 裡面會有唯一的 index，稱作 offset
  - Offset 為 Long 型態

- ### Replica

  - 各個 Topics 可設定 Replication Factor 通常為 2 ~ 3，下面的所有 Partition 都會產生這麼多的副本
  - 只要 Cluster，所有的 Partition 皆有一個副本在線，則服務不會中斷

- ### Partition Leader

  - Partition Leader 由 Broker Controller 決定，每個 Partition 會有一個 Leader
  - Partition Leader 負責所有 partition/replica 的讀/寫

- ### Partition Follower

  - 當 Leader 更新時，Follower 也需要跟著更新
  - Follower 平時是 Consumer，當 Leader 收到新的信息時 pull 並且寫入到自己的資料上
  - 當 Leader 掛掉，Broker Controller 會選出其中一個 Follower 當作該 Partition 的 Leader

- ### ISR

  - 當 Leader 收到訊息時，所有 Follower 都需要寫入，已經和 Leader 同步的 Replica 稱為 ISRs(in-sync replica)
  - Record 只有在全部的 ISR 都同步時，才被視為成功 Commited
  - Consumer 只能從已經 Commit 成功的 Record 讀取紀錄

## Kafka Cluster

- 超過一個以上的 Broker 稱作 Kafka Cluster
- Kafka cluster 可以 zero downtime 擴展
- Clusters are used to manage the persistence and replication of message data.
- 通常都會做 Cluster 以實現 Load Balancing

## ZooKeeper

- 管理叢集配置
- 負責管理及協調 Broker
- 通知 Producer 及 Consumer
  - 新的 Broker 出現
  - Broker failure
- 當 Zookeeper 發出通知，Consumer 及 Producer 根據通知決定要使用哪一個 Broker
- [https://zookeeper.apache.org/](https://zookeeper.apache.org/)

## Reference

- <https://www.tutorialspoint.com/apache_kafka/apache_kafka_introduction.htm>
- <https://github.com/abhioncbr/Kafka-Message-Server/wiki/Apache-of-Kafka-Architecture-(As-per-Apache-Kafka-0.8.0-Dcoumentation)>
- <https://medium.com/@poyu677/apache-kafka-%E7%B0%A1%E6%98%93%E5%85%A5%E9%96%80-db58898a3fab>
- <https://stackoverflow.com/questions/50227472/how-kafka-guarantees-zero-downtime-and-zero-data-loss>
- <http://cloudurable.com/blog/kafka-architecture-topics/index.html>
