---
title: "Spark Shell"
date: 2020-01-17T22:40:05+08:00
draft: true
tags: ["Hadoop", "Spark", "BigData"]
slug: "spark-p3-shell"
toc: false
categories: []
weight: 40
---

## Spark Test

當你打開 Spark-Shell 的時候，他會自動幫你打開一個叫 sc 的 SparkContext Instance

```bash
$ spark-shell
...
scala> val lines = sc.textFile("./content/posts/hadoop/kafka-p1.md")
lines: org.apache.spark.rdd.RDD[String] = README.md MapPartitionsRDD[1] at textFile at <console>:24

scala> val lineCounts = lines.count
lineCounts: Long = 3
```

## Count Line

```bash
val kfkLines = lines.filter(line=>line.contains("kafka"))
```

line=>line.contains("kafka")為一個匿名函式，輸入為 line，輸出則為含有 kafka 字串的行。將匿名函式導入 lines.filter 裡面。
