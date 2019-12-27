---
title: "關於這個blog"
date: 2018-05-06T19:19:34+08:00
draft: false
categories: [Web]
tags: [Web]
slug: about-this-blog
gitment: true
---

## Blog 到底怎麼寫，架在哪?

- 自己架站  
  掌握度最高，但除非是公司，基本上對個人來說算 overkill，花時間花錢。

- 靜態網頁  
  可以部署在 github 或 google docs 等地方，可以透過靜態網頁生成器產生。

- 平台  
  Wordpress.com, Medium 等等，wordpress 有點太大，而且有些漂亮的主題要花錢，會很不開心。

## 靜態網頁生成器(static site generator)

 網頁是透過工具，直接生成/render 好成 html 放在雲端。而不是靠後端去動態即時生成/render。  
另外注意靜態網頁生成器要開啟留言功能是比較麻煩的，需要另外配合 disqus 或是 gitment。

現在流行的靜態網頁生成器

- Jekyll  
  老字號，有 Github 支持，但網頁資源億多速度慢的缺點就會跑出來。
- Hexo  
  台灣人寫的，如果熟悉 node 可以試試看，用的渲染引擎似乎是 swig，沒有用過。
- Hugo  
  用 golang 寫的，但實際上不太需要 golang 語法，號稱生成文件很快。

## 我看的重點

- Markdown  
  寫過就回不去了
- Syntax Highlighting  
  寫的 code 會比較好看
- 主題
- documents & 線上討論

圖片我反而很少上傳所以不考慮

## 結論

最後選了 Hugo，但說實話他的 themes 還蠻複雜的，換 theme 或是上手需要一段時間，而且 docs 寫的很爛，但該有的功能都有(Markdown, Syntax Highlighting)，甚至也有一定的討論度，學會之後就可以用 markdown 爽爽寫。

## Hugo 使用

### 第一次使用

```bash
hugo new site quickstart
```

### 測試

```bash
#!/bin/bash
cd quickstart
hugo
hugo server
```

### 部署

這邊是有個小坑的，content 寫好的 markdown，是不會自動覆蓋到最終的資料夾裡面的，即使打 hugo 也沒有用。
總之手動刪除以後跑個 hugo 就可以了

```bash
rm -rf ./docs
hugo
```
