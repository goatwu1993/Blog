---
title: "怎麽用 Python 實作一個 Dictionary"
date: 2019-12-26T19:17:18+08:00
draft: false
categories: [Python]
tags: [Python, DataStructure]
slug: dictionary-python-implemetation
gitment: true
---

## Dictionary

Python Dictionary 的好大家都知道，但怎麼自己實作一個 Python Dictionary?

## 先開大招

直接偷看答案，看看 [cpython](https://github.com/python/cpython/blob/master/Objects/dictobject.c)怎麼寫準沒錯，用 C 寫看起來很難...  
還好[這邊](https://www.data-structures-in-practice.com/hash-tables/?fbclid=IwAR351NVEsa5779Ph_8wG7Pi5U40bQlafRDuXAZxAtJO-WOpCCjEMqv7g5HY)有一篇解釋，key-value pair 用 Hash Table 應該是正義，眉眉角角才是重點。

## Hash table 的好

- O(1) insertion
- O(1) get
- O(1) delete

然而以上 O(1)的時間複雜度，都是在 collision 不常發生的情況下，當 entry 越來越滿，碰撞越來越多，worst case 的時間複雜度就會是 O(n)，worst case 發生的機率和 load factor 有關。

## load factor & dynamic resizing

[wiki](https://en.wikipedia.org/wiki/Hash_table#Resizing_by_copying_all_entries)

load factor = n/k

- n is the number of entries occupied in the hash table.
- k is the number of buckets.

k 通常也被叫做 table size，有 n 筆資料，不會只開 n 個 entry，而是稍微大一些的 k 筆，所以總共佔比就是 load factor。

- 當 load factor 趨近 1，Worst Case 的查找時間趨近 O(n)
- 當 load factor 趨近 0，Worst Case 的查找時間趨近 O(1)。

然而實務上

- 開 Dictionary 要預估資料的筆數 n 很不現實
- load factor 趨近於 0，意味著 k >> n，也很不實際

普遍覺得 load factor 為 0.6~0.7 是 Space 和 Time 之間 Trade off 比較合理，大於這個值的話會變慢，因此大於這個值的話就要把 k 變大了，也就是 dynamic resizing。

## Hands on

### Dictionary Node

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

key 跟 value 很好理解，要注意的是 me_hash 是 key 的 hash 值，儲存 me_hash 的原因猜測是 Resize 的時候不需要再對 key 做 hash，看解說是比對的時候無償了比對鍵值還會比對 me_hash 值，不太清楚為什麼。

### collided

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

### Dictionary

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

先開一個大小為 8 的 list，由於沒有實作{}的讀取，因此 KVP 只能一個一個 set，另外由於不想每次要拿 n 的時候都要去做一個 O(k)的 for loop，因此直接開一個欄位來記，因此也要自己 maintain。

### Hash

```python
    def me_hash(self, key):
        """
        I dont know how to use byte in Python
        Store the hash sum as int instead
        """
        hex_int = siphash24(b'0123456789ABCDEF',
                            (str(key).encode('utf-8'))).hash()
        return hex_int
```

這邊一樣仿(ㄔㄠ ˉ)照(ㄒㄧ ˊ) cpython，使用 siphash，據說是一個相對平均且快速的 hash 方法，和加密用的 hash 要求似乎有點不太一樣，用過 md5 也是很 OK 的，只是轉成 int 相較麻煩，還要 digest 什麼的

這邊有另一個要注意的點，這邊 hash 出來的結果 cpython 是存 2 進位的 bytearray，原因是因為在做 hash table 的時候，出來的 hash 需要除以 k(table size)，如果存 bytearray 就可以使用 bitmask 代替除法，bitmask 相比除法省了許多時間。這邊我是直接存 int 起來用除。

### Resize (dynamic resizing)

每次做新增或刪除的時候呼叫，根據 load factor 做不同的事，如果超過界限就需要把 table size 變大。正常來說以 load factor 為 0.7 為合適的值。
cpython 是直接 table size double up，維持 size 是 2 的次方，原因是 hash 存 byte 就可以直接使用 bitmask 去判斷美個 node 要進入哪個 entry。
這裡 load factor 我們讓他維持在 1/3 以及 2/3 之間。

```python

    def resize(self):
        """
        Should change the size if load_factor > 2/3 or load_factor < 2/3
        Should do nothing if load_factor between 1/3 and 2/3
        """
        used = self.used_entry
        l = proper_size = len(self.buckets)
        load_factor = used/l
        if load_factor > 1/3 and load_factor < 2/3:
            return
        if load_factor < 1/3 and l == 8:
            return
        if load_factor >= 2/3:
            while load_factor > 2/3:
                proper_size *= 2
                load_factor = used/proper_size
        elif load_factor <= 1/3:
            while load_factor < 1/3:
                proper_size /= 2
                load_factor = used/proper_size
        else:
            raise IndexError('load factor:', load_factor, 'out of control')

        new_buckets = [None for x in range(0, proper_size)]
        for i in range(len(self.buckets)):
            if self.buckets[i]:
                key_me_hash = self.buckets[i].me_hash
                entry = key_me_hash % proper_size
                while new_buckets[entry]:
                    new_buckets[entry].collided = True
                    if entry < proper_size - 2:
                        entry += 1
                    else:
                        entry = 0
                new_buckets[entry] = self.buckets[i]
                new_buckets[entry].collided = False
        self.buckets = new_buckets
        return
```

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

基本上就是把 key hash 完去找，因為是最簡單的 open addressing，這個滿了就找下一個，比較簡單，但容易有一整排都滿(i~i+j 都被佔據)的情形發生。

```python
    def __repr__(self):
        s = ''
        for i in range(len(self.buckets)):
            if self.buckets[i]:
                s = s + self.buckets[i].__repr__() + ', '
        if not s:
            return "{}"
        else:
            return "{" + s[:-3] + "}"

    def __getitem__(self, key):
        key_me_hash = self.me_hash(key)
        l = len(self.buckets)
        entry = key_me_hash % l
        while self.buckets[entry]:
            if self.buckets[entry].key == key:
                return self.buckets[entry].value
            elif not self.buckets[entry].collided:
                raise KeyError(key)
            elif entry < l-2:
                entry += 1
            else:
                entry = 0
        raise KeyError(key)

    def __setitem__(self, key, value):
        self.used_entry += 1
        self.resize()
        self.used_entry = self.__len__()

        l = len(self.buckets)
        key_me_hash = self.me_hash(key)
        entry = key_me_hash % l
        while self.buckets[entry]:
            self.buckets[entry].collided = True
            if entry < l-2:
                entry += 1
            else:
                entry = 0
        self.buckets[entry] = DictionaryNode(key=key,
                                             value=value,
                                             me_hash=key_me_hash)

    def __delitem__(self, key):
        key_me_hash = self.me_hash(key)
        l = len(self.buckets)
        entry = key_me_hash % l
        while self.buckets[entry]:
            if self.buckets[entry].key == key:
                self.buckets[entry].key = None
                self.buckets[entry].value = None
                self.buckets[entry].me_hash = None
                return
            elif not self.buckets[entry].collided:
                raise KeyError(key)
            elif entry < l-2:
                entry += 1
            else:
                entry = 0
        raise KeyError(key)

    def __len__(self):
        counter = 0
        for i in range(len(self.buckets)):
            if self.buckets[i]:
                counter += 1
        return counter
```

## Github

完整 Code

## Reference

最後附上參考，尤其是第一個，講的很清楚，有一些太難的地方我也沒有仔細看懂就寫完了...

- [深度解說](https://www.data-structures-in-practice.com/hash-tables/?fbclid=IwAR351NVEsa5779Ph_8wG7Pi5U40bQlafRDuXAZxAtJO-WOpCCjEMqv7g5HY)
- [wiki](https://en.wikipedia.org/wiki/Hash_table#Resizing_by_copying_all_entries)
- [cpython](https://github.com/python/cpython/blob/master/Objects/dictobject.c)
- [Magic Method](https://blog.csdn.net/yuan_j_y/article/details/9317817)
