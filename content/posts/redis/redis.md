---
title: Redis
date: 2022-09-26
draft: false
tags: [redis]
slug: redis
summary: redis
---

## What is Redis

Redis is a key/value store

## Redis Slot

Redis is a kvs. A key is sloted and distributed to the node(master/slave) it belongs

## Redis init cluster

1. slot number -> 16384

## Sharding

1. Key Based Sharding (Hash Based sharding)
1. Range Based Sharding
1. Directory Based Sharding

Redis Use Key-Based Sharding

## Key Based Sharding Technique

1. Consistent Hashing
1. Hash slot

Redis use Hash Slot

## Redis cluster mode

1. Master/slave (Quoram)
1. Sentinel (Center Proxy)

## Redis Master/Slave Add node

```bash
redis-cli --cluster add-node
```

You have to assign

1. slot count.
1. Receive node id

The slot/key/value reassign is automatic
