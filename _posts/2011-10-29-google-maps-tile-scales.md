---
author: mattwigway
date: '2011-10-29 09:41:04'
layout: post
slug: google-maps-tile-scales
status: publish
title: Google Maps Tile Scales
wordpress_id: '193'
tags:
- bing
- google
- osm
- projection
- tile
- web
- zoom
---

I found this buried deep in an appendix of the [Mapnik XML Schema Reference](http://media.mapnik.org/docs/MapnikXMLDescription.pdf), and I thought it so useful I am reposting it here:








Zoom level Scale denominator

0 

559,082,264






1


279,541,132






2


139,770,566






3


69,885,283






4


34,942,642






5


17,471,321






6


8,735,660






7


4,367,830






8


2,183,915






9


1,091,958






10


545,979






11


272,989






12


136,495






13


68,247






14


34,124






15


17,062






16


8,531






17


4,265






18


2,133






19


1,066






20


533




These are used not only by Google Maps, but also by Bing Maps, OSM, CloudMade and many others, and in fact just about any Google Mercator tile source.
