---
title: "Why HUGO"
date: 2018-05-06T19:19:34+08:00
draft: false
categories: [Blog]
tags: [HUGO, Golang]
slug: Why-HUGO
gitment: true
---



## Why HUGO
I was using Wordpress.com previously. Then I want to take more controll of my blog.  
So as, WordPress(LAMP), Hexo(node.js), Ghostand(node.js) and HUGO(golang) is considered. It turns out to be HUGO, and reasons is as below.
## Pros
### Opensource
Though WordPress is an opensource project, MySQL, part of WordPress, is owned by Oracle. It is known that Oracle is now trying to charge the world with using JAVA, which is not cool.

Golang is held by Google, and there is no news that using Golang will need any license or fee so far.

### Static
Though Dynamic seems cool, it also waste you a lot of time while something go wrong and you will never know why. In fact, static page is good enough for most Blogs.

### Hosting
WordPress(LAMP) or other CMS will need a Server, which usually cost.

I considered Heroku, and found that Heroku support only PostgreSQL. MySQL server should be held at another Site.  
On the otherhand, integrating WordPress and PostgreSQL is also an effort. It is impossible to held a WordPress with a single Platform, and IaaS usually needs to pay.  

On the other hand, helding static page on github or other storage will take a lot less effort, and you can simply `git push` without restarting or running a service down/up script on your remote machine.

### Speed
Static page is quicker than dynamic page.  
### CLI
I have tried the CLI for both Hexo and HUGO, and HUGO's command is more clear to me.  
### COOL
Hexo is from Taiwan, but Golang and markdown language is cool as well. This page is also worte in markdown!  

## Cons

### Needs plugins to implement subcribe/leave message
And that is why dynamic web framework exist...

### Golang's resource is much less than Node.js
Almost any questions about Node.js was asked and solved on the Internet. But Golang is not yet that popular.  
However, when you are using HUGO, you do not necessary need to learn Golang. In fact, three commands(`HUGO new`, `HUGO --buildDrafts` and `HUGO server -D` ) will cover most of your needs.  

### Themes are less than WordPress
The themes are not that much now.

BUT HEY, All the themes is free on HUGO! Think about it, you do not want to see a bangin theme that needs to pay. 

