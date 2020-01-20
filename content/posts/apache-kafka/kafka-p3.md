---
title: "Apache Kafka - Docker setup"
date: 2020-01-15T21:15:08+08:00
draft: false
tags: ["Hadoop", "Kafka", "BigData"]
slug: "kafka-3"
# summary
summary: Kafka docker setup
# other configs
diagram: true
toc: true
weight: 40
---

## Repos

<https://github.com/wurstmeister/kafka-dockers>

## 修改文件檔

需要修改 IP 設定，自己在本地測試的話建議先看官方解說
<https://github.com/wurstmeister/kafka-docker/wiki/Connectivity>

## 啟動 Container

開 3 個 broker+1 個 Zookeeper

```bash
docker-compose up -d
docker-compose scale kafka=3
```

## 開 Shell

```bash
./start-kafka-shell.sh 192.168.2.122 192.168.2.122:2181
```

這個 container 的 IP 有可能不在 kafkadocker_default bridge 底下，要連到這些服務就需要通過 Host Machine 的 Port Forwarding

這些都已經設定寫好了，只需要輸入 Zookeeper 的 IP:port，這個 Shell 就可以通過 Zookeeper/Bootstrap Server 去找到全部可用的服務，他會把者 Argument 加進環境變數 HOST_IP/ZK。

不放心的話

```bash
printenv | grep -E 'HOST_IP|ZK'
```

## Topic 創建/查詢

```bash
## Create A Topic
kafka-topics.sh --create --topic topictest --partitions 4 --zookeeper $ZK --replication-factor 2

## Check topics
kafka-topics.sh --list  --zookeeper $ZK

## Check topic info
kafka-topics.sh --describe --topic topic --zookeeper $ZK
```

## Create a Producer

```bash
kafka-topics.sh --describe --topic topic --zookeeper $ZK
```

### Create a Consumer

建議在另外開一個 Shell

```bash
./start-kafka-shell.sh 192.168.2.122 192.168.2.122:2181
```

然後再啟動 Consumer

```bash
kafka-console-consumer.sh --topic=topic --bootstrap-server=`broker-list.sh` --from-beginning
```

## 參考資料

- <https://medium.com/@poyu677/apache-kafka-%E7%B0%A1%E6%98%93%E5%85%A5%E9%96%80-db58898a3fab>

- <https://github.com/wurstmeister/kafka-docker/wiki/Connectivity>
