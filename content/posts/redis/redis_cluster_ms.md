---
title: Redis-Cluster-MS
date: 2022-09-26
draft: false
tags: [redis]
slug: redis-cluster-ms
summary: redis-cluster-ms
---

## Redis Master/Slave mode

1. Each slave belongs to a Master
1. Each master is writable for it's slot's key/value

## Adding Node

```bash
redis-cli --cluster add-node
```

You have to assign

1. slot count.
1. Receive node id (master)

Then add slave to master

The slot/key/value reassign is automatic
