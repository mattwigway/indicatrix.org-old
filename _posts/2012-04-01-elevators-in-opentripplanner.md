---
author: mattwigway
date: '2012-04-01 21:00:53'
layout: post
slug: elevators-in-opentripplanner
status: publish
title: Elevators in OpenTripPlanner
wordpress_id: '301'
---

I've been working on the [OpenTripPlanner](http://opentripplanner.org) project quite a bit lately. One thing I did a month or so ago was to implement elevator support in the routing engine. I decomposed OSM nodes tagged highway=elevator by their constituent levels, and built edges between them to represent boarding, riding on, and alighting from an elevator. I was very impressed with the friendliness and responsiveness of the community.

One challenge was parsing OSM levels. They can come from multiple sources---level_map relations, level tags or layer tags. I wanted to support all of these, or any combination (on a single elevator). I originally did this by noting the source and adding 0, 1000 or 2000 to the level, but Andrew Byrd has made an OSMLevel class which handles this much more neatly. Level maps allow levels to be named, which is quite nice: "take elevator to garage" instead of "take elevator to -1." So, for all OSM mappers out there, here is a quick guide to making routable elevators:
	
* Tag your elevator nodes highway=elevator
* Add access restrictions: wheelchair=yes and bicycle=yes tags	
* Use an OSM Level Map relation if there is any possibility that level names would not be clear.

*EDIT:* To clarify, the level annotations are always on the _ways_ connecting to the elevators, not the elevator nodes themselves.
