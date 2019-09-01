---
title: "Why Hugo"
date: 2018-05-06T19:19:34+08:00
draft: false
categories: [Web]
tags: [Web]
slug: Why-Hugo
gitment: true
---

# Why Hugo

## Blog tools

I Googled and these solutions seems most popular & modern.

* WordPress
* WordPress.com
* Hexo
* [Hugo](https://gohugo.io)  

I choose Hugo at last after below considerations.

## Static vs Dynamic

* Dynamic  
Takes more time to maintain and debug. Require a server(which is a cost).

* Static  
Static page should be easy enough for a blog. However it does not provide native comment function. Fortunately, [gitment](https://github.com/imsun/gitment) should be an acceptable workaround.

## Server & Database

* I found no solution to host Wordpress(with source code) at a free server. [Heroku](https://www.heroku.com/) get close to it but support only PostgreSQL.  
  * Host MySQL on another site
  * Integrate WordPress and PostgreSQL  

  Either take some efforts.  

* Meanwhile, github.io just came out and seems wonderful for static page.

## User interface

* Wordpress  
Wordpress get a clear and attractive UI. However it is a dynamic framework.
* Hexo  
CLI. Take me a while to understand.
* Hugo  
CLI. However it seems more comprehesive to me.

## Language

Hugo use Markdown, which I was familiar to.

## Themes

To be honest, Hugo has less themes than the others (while this was written). But HEY, all themes are free!!! I hate to see cool themes cost.

## Conclusion

I choose Hugo. and all I need to do is

* Write feeds with markdown
* `$ hugo`
* `$ git add ...`
* `$ git push`

All seems fine!
