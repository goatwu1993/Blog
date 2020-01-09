+++
title = "Apache Kafka"
date = 2020-01-09T19:53:34+08:00
draft = false
tags = ["scala", "BigData"]
slug = "apache-kafka"
gitment = true
toc= true
categories = []
weight= 40
+++

## What is Kafka

- Kafka 是一個流處理平台(stream processing platform)，分散式的 publish-subscribe 訊息系統加上可靠的 queue 讓 Kafka 能夠處理巨量的資料流

- Kafka使用效率優化過的 binary TCP-based protocol，通過一個抽象的 message set 將訊息合在一起以減少網路封包的Overhead。
- Kafka 基於 commit log，使用者可以 subscribec 或 publish data 到多個系統或是 App。
- built on top of the ZooKeeper synchronization service.
- Kafka 可透過 Kafka Connect 外部系統（用於資料輸入/輸出
- Kafka 提供了 Kafka Streams: 一個 java stream processing 庫.
- Kafka is a unified platform for handling all the real-time data feeds. Kafka supports low latency message delivery and gives guarantee for fault tolerance in the presence of machine failures. It has the ability to handle a large number of diverse consumers. Kafka is very fast, performs 2 million writes/sec. Kafka persists all data to the disk, which essentially means that all the writes go to the page cache of the OS (RAM). This makes it very efficient to transfer data from page cache to a network socket

- Kafka的優點
    - Reliability − Kafka is distributed, partitioned, replicated and fault tolerance.

    - Scalability − Kafka messaging system scales easily without down time..

    - Durability − Kafka uses Distributed commit log which means messages persists on disk as fast as possible, hence it is durable..

    - Performance − Kafka has high throughput for both publishing and subscribing messages. It maintains stable performance even many TB of messages are stored.
- Kafka is very fast and guarantees zero downtime and zero data loss.

- Example applications include managing passenger and driver matching at Uber, providing real-time analytics and predictive maintenance for British Gas’ smart home, and performing numerous real-time services across all of LinkedIn.


## Kafka terminologies

- Producers
  - Producers are the publisher of messages to one or more Kafka topics.
  - Push data to brokers.
  - When new broker is started, all the producer search it and automatically send a message to the new broker. Producer does not wait for ack from broker and send messages as fast as broker can handle.
  
- Kafka cluster
  - 資料流可被分為多個不同的partition以及topics
  - Within a partition 裡面，訊息根據 offset (位置) 嚴格排序，並和 timestamp 一同存放。
- Topics
  - A stream of messages belonging to a particular category is called a topic. Data is stored in topics.
  - Topics are split into partitions. For each topic, Kafka keeps a mini-mum of one partition. Each such partition contains messages in an immutable ordered sequence. A partition is implemented as a set of segment files of equal sizes.
- Partitions
  - Topics may have many partitions, so it can handle an arbitrary amount of data.
  - Partition offset: Each partitioned message has a unique sequence id called as offset.
  - Replicas of partition
    Replicas are nothing but backups of a partition. Replicas are never read or write data. They are used to prevent data loss.
- Brokers
  - Brokers are simple system responsible for maintaining the pub-lished data. Each broker may have zero or more partitions per topic. Assume, if there are N partitions in a topic and N number of brokers, each broker will have one partition.
  - Assume if there are N partitions in a topic and more than N brokers (n + m), the first N broker will have one partition and the next M broker will not have any partition for that particular topic.
  - Assume if there are N partitions in a topic and less than N brokers (n-m), each broker will have one or more partition sharing among them. This scenario is not recommended due to unequal load distri-bution among the broker.
  - Stateless
  - 透過Zookeeper來維持Cluster State，Kafka broker instance 每秒需要處理上千個 read/write，每個broker可以處理TB級別的訊息並不影響performance。
- Kafka Cluster
  - Kafka’s having more than one broker are called as Kafka cluster. A Kafka cluster can be expanded without downtime. These clusters are used to manage the persistence and replication of message data.
  - 通常都會有多個Broker 做 Load Balancing
- Consumers
  - 從 partition 讀取訊息
  - Consumers read data from brokers. Consumers subscribes to one or more topics and consume published messages by pulling data from the brokers.
  - Since Kafka brokers are stateless, which means that the consumer has to maintain how many messages have been consumed by using partition offset. If the consumer acknowledges a particular message offset, it implies that the consumer has consumed all prior messages. The consumer issues an asynchronous pull request to the broker to have a buffer of bytes ready to consume. The consumers can rewind or skip to any point in a partition simply by supplying an offset value. Consumer offset value is notified by ZooKeeper.
- Leader  
  - Leader is the node responsible for all reads and writes for the given partition. Every partition has one server acting as a leader.
  - Broker Leader election 可透過 Zookeeper 完成
- Follower
  - Node which follows leader instructions are called as follower. If the leader fails, one of the follower will automatically become the new leader. A follower acts as normal consumer, pulls messages and up-dates its own data store.
- ZooKeeper
  - 負責管理及協調Kafka broker
  - 通知Producer及consumer
    - 新的broker出現
    - broker failure
  - 當 Zookeeper 發出通知，Consumer及Producer根據通知決定要使用哪一個broker

## 流處理 Stream Processing

- Kafka offers Stream API that allows writing Java application that consume data from Kafka and write results back to Kafka.
- Also works with external stream processing systems such as Apache Spark.

## Cluster

- Kafka 叢集可運行在一個或多個 Server
- Partitions of all topics are distributed across the cluster nodes.
- This architecture allows Kafka to deliver massice streams of message in a fault-tolerant fashion and has allowed it to replace some of the conventional messaging systems like Java Message Service, Advanced Message Queuing Protocol.
- Offers trancactional writes, which provide stream processing using the streams API.

## Topics

Topics 分成兩種，Regular 及 Compacted

### 1. Regular Topics

Regular topics can be configured with a retention time or a space bound. If there are records that are older than the specified retentio time of if the space bouund is exceeded for a partition, Kafka is alllowed to delete old data to free storage space.

By default, topics are configured with a retention time of 7 days, but it's also possible to sotre data indefinitely.

### 2. Compacted topics

For compacted topics, records do not expire based on time or space bounds.
Instead, Kafka treats later messages as update to older message with the same key and guarantees never to delete the latest message per key. Users can delete messages entirely by writing a so called tombstone message with null value for a specific key.

## Four Major APIs in Kafka.

### Producer API

Permits an application to publish stream of records.

### Consumer API

Permits an application to subscribe to topics and processes streams of records.

### Connecter API

Executes athe reusable producer and consumer APIs that can link the topics to the existing application.

### Streams API

This API converts the input streams to output and produces the results

The consumer API and producer APIs build on top of the Kafka messaging protocol and offer a reference implementation for Kafka consumer and producer clients in Java. The underlying messaging protocol is a binary protocol that develops can use to write their own consumer or producer clients in any programming language. This unlocks Kafka from the JVM eco-system.

## Kafka Connect API

Kafka Connect (Connect API) is a framework to import/export data from/to other systems.

## Kafka Streams API

Kafka Streams (or Streams API) is a stream-processing library written in Java. It was added in the Kafka 0.10.0.0 release. The library allows for the development of stateful stream-processing applications that are scalable, elastic, and fully fault-tolerant. The main API is a stream-processing domain-specific language (DSL) that offers high-level operators like filter, map, grouping, windowing, aggregation, joins, and the notion of tables. Additionally, the Processor API can be used to implement custom operators for a more low-level development approach. The DSL and Processor API can be mixed, too. For stateful stream processing, Kafka Streams uses RocksDB to maintain local operator state. Because RocksDB can write to disk, the maintained state can be larger than available main memory. For fault-tolerance, all updates to local state stores are also written into a topic in the Kafka cluster. This allows recreating state by reading those topics and feed all data into RocksDB.

## Kafka version compatiblilty

Up to version 0.9.x Kafka brokers are backward compatible with older clients only.

Since 0.10.0.0, brokers are also forward compatible with newer clients.

For Streams API, full compatiblity starts with version 0.10.1.0

Latest version 2.4

Github: https://github.com/apache/kafka

## Kafka performance

Monitoring end-to-end performance requires tracking metrics from brokers, consumer, and producers, in addition to monitoring ZooKeeper, which Kafka uses for coordination among consumers.[6][7] There are currently several monitoring platforms to track Kafka performance, either open-source, like LinkedIn's Burrow, or paid, like Datadog. In addition to these platforms, collecting Kafka data can also be performed using tools commonly bundled with Java, including JConsole.[8]

## Reference

- https://www.tutorialspoint.com/apache_kafka/apache_kafka_introduction.htm
