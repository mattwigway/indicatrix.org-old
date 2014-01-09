---
author: mattwigway
layout: single-post
slug: schellings-segregation-model-js
status: publish
title: Schelling's Segregation Model in JavaScript
---

<a href="/segregation.js"><img class="pull-left" src="/img/2013/12/28/schellings-segregation-model-js/schelling.png" /></a>

<div class="clear"></div>

[Schelling's segregation model](https://class.coursera.org/modelthinking/lecture/16) is an interesting model of neighborhood dynamics developed by the economist Thomas C. Schelling. It's an agent based model, in which agents of two groups (which could be based on income, political affiliation, race, &c.) are placed on a grid. There is some threshold for what percentage of an agent's neighbors must be of the same group for it to be happy. For instance, agents might want 30% of their neighbors to be of the same group. If they are not happy, they move. This continues until all agents are happy.

What's interesting about the model is that relatively low thresholds for individuals (e.g. 30%) end up leading to extreme segregation in the aggregate (Indeed, Schelling's book is called _Micromotives and Macrobehavior_). This segregation can be easily seen in the above screenshot: the tolerance is set at 30%, but on average 77% of each agents neighbors are of the same group.

Browser-based interactive implementations of the model [have been around](http://ccl.northwestern.edu/netlogo/models/Segregation) [for a while](http://web.mit.edu/rajsingh/www/lab/alife/schelling.html), but they all seem to require Java. This is often an obstacle, so I implemented an interactive version using JavaScript and [D3](http://d3js.org). It should run with no plugins in Firefox, Chrome, Safari and possibly recent versions of Internet Explorer. My implementation is [here](/segregation.js).

A full description of the model can be found in Schelling's book _Micromotives and Macrobehavior_, on pages 147--155 (in the 1978 edition anyhow).
