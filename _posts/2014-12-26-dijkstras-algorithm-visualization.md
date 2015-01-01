---
title: "Dijkstra's Algorithm Visualization in the Browser"
author: mattwigway
layout: single-post
---

<a href="http://projects.indicatrix.org/dijkstra.js/"><img src="/img/2014/12/dijkstra.png" alt="visualization of Dijkstra's algorithm"/></a>

[Dijkstra's algorithm](http://en.wikipedia.org/wiki/Dijkstra%27s_algorithm) is a
method for finding the shortest path through a [graph](http://en.wikipedia.org/wiki/Graph_%28mathematics%29)
with non-negative edge weights. It is a relatively efficient algorithm, and is guaranteed to
find the shortest path (unlike some heuristic algorithms). It's a fairly simple algorithm,
but also one that can be difficult to wrap one's head around. Descriptions abound on the Internet,
and there are a number of videos, and even a few interactive demonstrations, but I thought there
needed to be a demonstration that was interactive, worked in modern browsers without a plugin,
used a non-trivial graph, and was open source. So I [wrote one](http://projects.indicatrix.org/dijkstra.js).
A prose description of the algorithm is there; I hope it's easier to understand with the interactive component.
Visualizing algorithms tends to make them easier to understand, as observed by [Mike Bostock](http://bost.ocks.org/mike/algorithms/).
