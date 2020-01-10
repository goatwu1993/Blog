+++
title = "Apache Kafka - Part2"
date = 2020-01-09T19:53:34+08:00
draft = false
tags = ["scala", "BigData"]
slug = "apache-kafka-2"
gitment = true
toc= true
categories = []
weight= 40
+++

## Kafka 名詞

Kafka 可以被分為多個 Topics，每個 topic 可以再分為多個 partitions，partition 是一個 message queue，其中 message 按照 index/offset 排序。

All the data in a Kafka cluster is the disjointed union of partitions. Incoming messages are written at the end of a partition and messages are sequentially read by consumers. Durability is provided by replicating messages to different brokers.

## Producers

- Producers are the publisher of messages
- Producer can publish message to one or more Kafka topics.
- Messages are pushed to brokers.
- When new broker is started, all the producer search it and automatically send a message to the new broker. Producer does not wait for ack from broker and send messages as fast as broker can handle.

## Topics

- A stream of messages belonging to a particular category is called a topic. Data is stored in topics.
- 每個 topic 可以再分為多個 partitions，partition 是一個 message queue，其中 message 按照 index/offset 排序。
- For each topic, Kafka keeps a mini-mum of one partition.
- Each such partition contains messages in an immutable ordered sequence. A partition is implemented as a set of segment files of equal sizes.

### 1. Regular Topics

Regular topics can be configured with a retention time or a space bound. If there are records that are older than the specified retentio time of if the space bouund is exceeded for a partition, Kafka is alllowed to delete old data to free storage space.

By default, topics are configured with a retention time of 7 days, but it's also possible to sotre data indefinitely.

### 2. Compacted topics

For compacted topics, records do not expire based on time or space bounds.
Instead, Kafka treats later messages as update to older message with the same key and guarantees never to delete the latest message per key. Users can delete messages entirely by writing a so called tombstone message with null value for a specific key.

## Partitions

### Partitions 定義

Topics may have many partitions, so it can handle an arbitrary amount of data.

### Partition offset

Each partitioned message has a unique sequence id called as offset.

### Replicas of partition

Replicas are nothing but backups of a partition. Replicas are never read or write data. They are used to prevent data loss.

## Brokers

### Brokers 定義

Brokers are simple system responsible for maintaining the pub-lished data. Each broker may have zero or more partitions per topic. Assume, if there are N partitions in a topic and N number of brokers, each broker will have one partition.

- Assume if there are N partitions in a topic and more than N brokers (n + m), the first N broker will have one partition and the next M broker will not have any partition for that particular topic.
- Assume if there are N partitions in a topic and less than N brokers (n-m), each broker will have one or more partition sharing among them. This scenario is not recommended due to unequal load distri-bution among the broker.

### Stateless

- 透過 Zookeeper 來維持 Cluster State，Kafka broker instance 每秒需要處理上千個 read/write，每個 broker 可以處理 TB 級別的訊息並不影響 performance。

## Kafka Cluster

- 資料流可被分為多個不同的 partition 以及 topics
- Within a partition 裡面，訊息根據 offset (位置) 嚴格排序，並和 timestamp 一同存放。
- Kafka’s having more than one broker are called as Kafka cluster. A Kafka cluster can be expanded without downtime. These clusters are used to manage the persistence and replication of message data.
- 通常都會有多個 Broker 做 Load Balancing

## Consumers

- 從 partition 讀取訊息
- Consumers read data from brokers. Consumers subscribes to one or more topics and consume published messages by pulling data from the brokers.
- Since Kafka brokers are stateless, which means that the consumer has to maintain how many messages have been consumed by using partition offset. If the consumer acknowledges a particular message offset, it implies that the consumer has consumed all prior messages. The consumer issues an asynchronous pull request to the broker to have a buffer of bytes ready to consume. The consumers can rewind or skip to any point in a partition simply by supplying an offset value. Consumer offset value is notified by ZooKeeper.

## Leader

- Leader is the node responsible for all reads and writes for the given partition. Every partition has one server acting as a leader.
- Broker Leader election 可透過 Zookeeper 完成

## Follower

- Node which follows leader instructions are called as follower. If the leader fails, one of the follower will automatically become the new leader. A follower acts as normal consumer, pulls messages and up-dates its own data store.

## ZooKeeper

- 負責管理及協調 Kafka broker
- 通知 Producer 及 consumer
  - 新的 broker 出現
  - broker failure
- 當 Zookeeper 發出通知，Consumer 及 Producer 根據通知決定要使用哪一個 broker

## Cluster

- Kafka 叢集可運行在一個或多個 Server
- Partitions of all topics are distributed across the cluster nodes.
- This architecture allows Kafka to deliver massice streams of message in a fault-tolerant fashion and has allowed it to replace some of the conventional messaging systems like Java Message Service, Advanced Message Queuing Protocol.
- Offers trancactional writes, which provide stream processing using the streams API.

## Reference

- https://www.tutorialspoint.com/apache_kafka/apache_kafka_introduction.htm
