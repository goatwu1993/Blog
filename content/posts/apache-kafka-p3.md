+++
title = "Apache Kafka P3"
date = 2020-01-10T17:14:42+08:00
draft = true
tags = ["Hadoop", "Kafka","BigData"]
categories = []
+++

## Four Major APIs in Kafka

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

[Github](https://github.com/apache/kafka)

## Kafka performance

Monitoring end-to-end performance requires tracking metrics from brokers, consumer, and producers, in addition to monitoring ZooKeeper, which Kafka uses for coordination among consumers.[6][7] There are currently several monitoring platforms to track Kafka performance, either open-source, like LinkedIn's Burrow, or paid, like Datadog. In addition to these platforms, collecting Kafka data can also be performed using tools commonly bundled with Java, including JConsole.[8]
