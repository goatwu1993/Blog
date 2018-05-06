---
title: "Why HUGO"
date: 2018-05-06T19:19:34+08:00
draft: false
categories: [Blog]
tags: [HUGO, Golang]
---
<h2>Why HUGO</h2>
I was using Wordpress.com previously. Then I want to take more controll of my blog.
So as, WordPress(LAMP), Hexo(node.js), Ghostand(node.js) and HUGO(golang) is considered. It turns out to be HUGO, and reasons is as below.
<h2>Pros</h2>
<h3>Opensource</h3>
Though WordPress is an opensource project, MySQL, part of WordPress, is owned by Oracle. It is known that Oracle is now trying to charge the world with using JAVA, and this does not sound great to me.

Golang is held by Google, and there is no news that using Golang will need any license or fee so far.

<h3>Static</h3>
Though Dynamic seems cool, it also waste you a lot of time while something go wrong and you will never know why. In fact, static page is good enough for most Blogs.

<h3>Hosting</h3>
WordPress(LAMP) or other CMS will need a HOST/Server. It is not easy to find a free hosting server.

I considered Heroku, and found that it has defualt PostgreSQL, and will need to host your MySQL server at another Site! Seems like integrating WordPress and PostgreSQL is praitical, but I have quit without even trying. The conclusion is that it is almost impossible to implement a CMS with a single Platform, and IaaS usually needs to pay.

On the other hand, helding static page on github or other storage will take a lot less effort, and you can simply <code>git push</code> without restarting or running a service down/up script on your remote machine.

<h3>Speed</h3>
Static page is quicker than dynamic page.

<h3>CLI</h3>
I have tried the CLI for both Hexo and HUGO, and HUGO's command is more clear to me

<h3>COOL</h3>
I was considering Hexo cause it is from Taiwan, but Golang seems cool to me...

