---
title: "Python 實作 Dictionary"
date: 2019-12-26T19:17:18+08:00
draft: false
categories: [datastructure]
tags: [python, datastructure]
slug: dict-python-implementation
gitment: true
weight: 40
---

## Dictionary

Python Dictionary 的好大家都知道，這篇反過來用 Python 實作一個 Dictionary

## 先開大招

直接偷看答案，看看 [cpython](https://github.com/python/cpython/blob/master/Objects/dictobject.c)怎麼寫準沒錯，用 C 寫看起來就很難，還好[這邊](https://www.data-structures-in-practice.com/hash-tables/?fbclid=IwAR351NVEsa5779Ph_8wG7Pi5U40bQlafRDuXAZxAtJO-WOpCCjEMqv7g5HY)有一篇解釋，總之，key-value pair 用 hash table 是正義，實作上的眉眉角角才是重點。

## Hash table 的好

- O(1) insertion
- O(1) get
- O(1) delete

O(1) 94 狂，然而以上 O(1)的時間複雜度，都是指 average case 。

當 entry 越來越滿，worst case 就容易發生，worst case 發生的機率和下面要講的 load factor 正相關。

## load factor & dynamic resizing

[wiki](https://en.wikipedia.org/wiki/Hash_table#Resizing_by_copying_all_entries)

load factor = n/k

- n is the number of entries occupied in the hash table.
- k is the number of buckets.

k 通常也被叫做 table size。有 n 筆資料，不會只開 n 個 entry，而是稍微大一些的 k 筆，所以 n 總共佔 k 的比例就是 load factor。

- 當 load factor 趨近 1，Worst Case 機率增加，平均查找時間 O(n)
- 當 load factor 趨近 0，Worst Case 機率較少，平均查找時間 O(1)。

實務上

- 開 Dictionary 要預估資料的筆數 n 很不實際
- load factor 趨近於 0，雖然有 O(1)的查找，但 k >> n 表示要開很大的 table size 儲存相對很少的資料，很浪費空間。
- load factro 趨近於 1，很省空間，但查找時間趨近 O(n)，失去 hash table 的初心。

因此一般來說， load factor 介於 0.6 至 0.7 ，算是空間時間比較平衡，根據 n 調整 k 的手段就是 dynamic resizing

## Dictionary Node

```python
class DictionaryNode():
    """
    Node of a DictionaryLinkedList.
    """

    def __init__(self, key, value, me_hash):
        self.key = key
        self.value = value
        self.me_hash = me_hash
        self.collided = False

    def __repr__(self):
        return (self.key.__repr__() + ": " + self.value.__repr__())
```

### me_hash

me_hash 是 key 的 hash 值，根據 cpython 以及講解，是 get 的時候比對會用到

```c
(ep->me_key == key ||
(ep->me_hash == hash && unicode_eq(ep->me_key, key)))
```

感覺是比對

- key 值本身
- hash+unicode

兩者其中一個為 True 則判斷為 key 相同，詳細情形可能要對編碼比較熟才看得懂，這份 code 只有存起來放著等以， resize 就不需要重算一次。

### collided

一個確認有沒有 collide 過的 flag

- insert  
  若 entry 已被佔用，則將此 entry 的 collided 屬性設定為 True，再往後面找。

- delete  
  若 collide 為 True，應該將 key, value 設定為 None 或是整個 node 換成另一種 class，告訴大家這 node 已經被刪除了，但你還是應該往後尋找。
- get 的 pseudo code

```python
    def get(key):
        entry = me_hash(key)
        while is_valid(entry):
            if hash_table[entry] == None:
                # 這個Entry從來沒有被使用過
                raise IndexError('key not exist')
            elif hash_table[entry] and \
                    hash_table[entry].key != key and \
                    not hash_table[entry].collided:
                # 此entry已經有值，但key不對，但沒有發生過collided=>
                # 只是剛好entry相同，且沒發生collide，直接返回indexError即可
                raise IndexError('key not exist')
            elif hash_table[entry] and \
                    hash_table[entry].key != key and \
                    hash_table[entry].collided:
                # 此entry已經有值，但key不對，但有發生過collided =>
                # 往下查找
                entry += 1
            elif hash_table[entry] and \
                not hash_table[entry].key and \
                not hash_table[entry].value and
            hash_table[entry].collided:
                # 此Node被del，但為了提示之後要往後查找，流下 collided 屬性。
                entry += 1
            elif hash_table[entry] and hash_table[entry].key == key:
                return hash_table[entry].value
```

## Dictionary Class

```python
class Dictionary():
    """
    Dictionary are implemented by HashTable
    Using open addressing method.
    Hash using siphash. I can not find siphash
    """

    def __init__(self):
        self.used_entry = 0
        self.buckets = [None for x in range(0, 8)]
```

先開一個大小為 8 的 list，由於沒有實作{}的讀取，因此 KVP 只能一個一個 set。

另外由於不想每次要拿長度或是算 load factor 的時候都要去做一個 O(k)的 for loop，因此直接開一個欄位(self.used_entry)來記，insert/del 要記得 maintain。

## Hash

仿照 cpython 用 siphash，據作者所述是一個相對平均且快速的 hash ，用過 md5 也是很 OK 的，只是轉成 int 相較麻煩，還要 digest 什麼的)，開頭要記得 import。

```bash
pip install siphash
```

```python
from siphash import siphash24
```

### Dictionary 的 me_hash()

```python
    def me_hash(self, key):
        """
        hash of key
        """
        return siphash24(b'0123456789ABCDEF',(str(key).encode('utf-8'))).hash()
```

## Resize (dynamic resizing)

### proper_size()

給定 n 筆 data，根據 load factor 的合理範圍算出合適的 data_size，原則

- 1/3 < n/proper_size < 2/3
- proper_size 為 2 的任意正整數次方(2^integer)

### resize()

任何牽涉到 len 增加/減少時都應該呼叫，算出 proper_size，若 data_size 改變則把 buckets 裡面的東西全部 dump 到 new_buckets。

### bitmask (&) 運算

當 k (table size) 是 2 的 m 次方，則 hash(n) mod k 可以用 hash(n) & bitmask 取代，其中 bitmask 為 m 個 1 組成。

Python 命令列 demo

```python
>>> def hash(key): return siphash24(b'0123456789ABCDEF',(str(key).encode('utf-8'))).hash()
...
>>> n = 'key_string'
>>>
>>> # m = 3, k = 8
...
>>> hash(n) & 0b111 == hash(n) & 7
True
>>> hash(n) & 0b111 == hash(n) % 8
True
>>>
>>> # m = 4, k = 16
...
>>> hash(n) & 0b1111 == hash(n) & 15
True
>>> hash(n) & 0b1111 == hash(n) % 16
True
>>>
```

### resize 程式碼

```python
    def resize(self):
        """
        Should change the size if load_factor > 2/3 or load_factor < 2/3
        Should do nothing if load_factor between 1/3 and 2/3
        """
        def proper_size(n, k):
            pro_size = 8 if n <= 2 else 2**(int(n * 1.5)).bit_length()
            return pro_size

        used = self.used_entry
        old_size = len(self.buckets)
        new_size = proper_size(used, old_size)
        if old_size == new_size:
            return
        new_buckets = [None for x in range(0, new_size)]
        for i in range(old_size):
            if self.buckets[i] and (self.buckets[i].key is not None):
                key_me_hash = self.buckets[i].me_hash
                # & for bitwise operation (bitmask)
                entry = key_me_hash & (new_size-1)
                while new_buckets[entry]:
                    new_buckets[entry].collided = True
                    entry = entry+1 if entry < (new_size-2) else 0
                new_buckets[entry] = self.buckets[i]
                new_buckets[entry].collided = False
        self.buckets = new_buckets
```

## 實作 insert/find/delete

### python Magic Methods

為了讓這個 class 更像內建的 dictionary，需要實作幾個 python 內建的 Magic Methods

```python
# __setitem__
a[b] = c
# __getitem__
a[b]
# __len__
len(a)
# __delitem__
del a[b]
```

總的來說就是需要把以上幾個 Magic Methods 實作。

### Open Addressing

這裡用的是最簡單的 open addressing，entry 被佔據就找下一個，比較簡單，但容易有連續一整攤都被 occupied 的情形發生，如果有興趣可以實作其他的 open addressing 算法。

### Magic Methods 程式碼

```python
    def __repr__(self):
        s = ''
        for i in range(len(self.buckets)):
            if self.buckets[i]:
                s = s + self.buckets[i].__repr__() + ', '
        return {} if not s else "{{{0}}}".format(s[:-3])

    def __getitem__(self, key):
        key_me_hash = self.me_hash(key)
        l = len(self.buckets)
        entry = key_me_hash & (l-1)
        while self.buckets[entry]:
            if self.buckets[entry].key == key:
                return self.buckets[entry].value
            if not self.buckets[entry].collided:
                raise KeyError(key)
            entry = entry+1 if entry < (l-2) else 0
        raise KeyError(key)

    def __setitem__(self, key, value):
        self.used_entry += 1
        self.resize()

        l = len(self.buckets)
        key_me_hash = self.me_hash(key)
        entry = key_me_hash & (l-1)
        while self.buckets[entry]:
            self.buckets[entry].collided = True
            entry = entry+1 if entry < (l-2) else 0
        self.buckets[entry] = DictionaryNode(key=key,
                                             value=value,
                                             me_hash=key_me_hash)

    def __delitem__(self, key):
        key_me_hash = self.me_hash(key)
        l = len(self.buckets)
        entry = key_me_hash & (l-1)
        while self.buckets[entry]:
            if self.buckets[entry].key == key:
                self.buckets[entry].key = None
                self.buckets[entry].value = None
                self.buckets[entry].me_hash = None
                return
            if not self.buckets[entry].collided:
                raise KeyError(key)
            entry = entry+1 if entry < (l-2) else 0
        raise KeyError(key)

    def __len__(self):
        counter = 0
        for i in range(len(self.buckets)):
            if self.buckets[i]:
                counter += 1
        return counter
```

## 完整程式碼

[Github](https://github.com/goatwu1993/data_structure/blob/master/hash_table.py)

## Reference

最後附上參考資料，建議看第一個，講的很清楚，有一些太難的地方我也沒有仔細看懂就寫完了...

- [大神解說](https://www.data-structures-in-practice.com/hash-tables/?fbclid=IwAR351NVEsa5779Ph_8wG7Pi5U40bQlafRDuXAZxAtJO-WOpCCjEMqv7g5HY)
- [wiki](https://en.wikipedia.org/wiki/Hash_table#Resizing_by_copying_all_entries)
- [cpython](https://github.com/python/cpython/blob/master/Objects/dictobject.c)
- [Magic Method](https://blog.csdn.net/yuan_j_y/article/details/9317817)
