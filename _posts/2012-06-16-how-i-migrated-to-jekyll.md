---
author: mattwigway
slug: how-i-migrated-to-jekyll
layout: single-post
title: How I Migrated to Jekyll
date: 2012-06-16 18:13:00
---

This is a short post about how I migrated this blog from [its previous home on WordPress](http://indicatrix.wordpress.com) to its new home here.

I first created a Jekyll theme I liked using [Bootstrap](http://twitter.github.com/bootstrap). Then I imported the posts using a customized version of [exitwp](https://github.com/thomasf/exitwp), which I modified to handle WordPress's \[sourcecode\] syntax and to convert the the proper Pygments syntax. I also modified it to move all of the images locally to my blog. I then edited each post manually to remove strange characters that were left behind (presumably a charset issue). I am using rdiscount and SmartyPants to get typographically-correct quotes--and dashes.

For comments, I imported my WordPress export into [Disqus](http://disqus.com). To protect the privacy of commenters, I used regular expressions to remove all of the email addresses and IP addresses from the file before uploading it. I also removed all of the uses of the contact form from the file.

And the hosting. I am set up using a domain from [namecheap.com](http://namecheap.com). This is CNAMEd to mattwigway.github.com, which is serving this site (thanks GitHub!). I am not sending Jekyll files directly, but rather am generating HTML locally and uploading it. I'm doing this because I want my [404 page](/thispagewillneverexist) to be Jekyll-generated. Also, I use the LSI related posts, rdiscount and SmartyPants, and I'm not sure if they'll work with GitHub Jekyll (I didn't try it).
