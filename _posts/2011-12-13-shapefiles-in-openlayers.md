---
author: mattwigway
date: '2011-12-13 21:59:47'
layout: single-post
slug: shapefiles-in-openlayers
status: publish
title: Shapefiles in OpenLayers
wordpress_id: '225'
tags:
- binary
- javascript
- js
- openlayers
- shapefile
- webmapping
---

Update 2011-12-14: It seems that a lot of people are coming here from web searches with phrases like "shapefile openlayers." If all you want to do is display your data in OpenLayers, I'd highly recommend using a program like [Quantum GIS](http://qgis.org) to convert your Shapefile to a more web-friendly format like KML or GeoJSON. Both of these formats can be read by OpenLayers directly, and you'll see faster performance and more browser compatibility than if you were to load your Shapefiles directly.

[![](/a/2011-12-13-shapefiles-in-openlayers/screenshot-at-2011-12-13-214616.png)](http://indicatrix.files.wordpress.com/2011/12/screenshot-at-2011-12-13-214616.png)

Over the last few days, I've been using Tom Carden's [shapefile-js](https://github.com/RandomEtc/shapefile-js) library that reads ESRI Shapefiles in JavaScript, which I found via [a post on the Prodevelop blog](http://www.prodevelop.es/es/blog/11/12/11/rendering-local-shapefiles-html5). The library is quite incredible, but his samples use a simple canvas for display. I thought it would be really cool if this could be integrated with [OpenLayers](http://openlayers.org), so I created a bit of JavaScript to do so. You can give it a test drive [here](http://mattwigway.github.com/shapefile-js/ol_simple.html), and look at the code [on GitHub](https://github.com/mattwigway/shapefile-js/tree/openlayers).

Basically, the library does all the heavy lifting. [My code](https://github.com/mattwigway/shapefile-js/blob/openlayers/src/ol_shapefile.js#L16) converts the shapefile shapes to WKT, which is passed to OpenLayers. Ultimately, I'd like to see an OpenLayers plugin so that you can use Shapefiles directly (i.e., an OpenLayers.Format.Shapefile). The main issue I see is that there needs to be a new strategy as well as a new format, because a) Shapefiles are made up of multiple pieces and b) we need to use the BinaryAjax loader since Shapefiles are binary.

My code seems to work well with points, lines and polygons, including the donut polygon case (to see for yourself, look at South Africa). (I did not test the donut polygon case, but I think it should work). More eyes are of course welcome! Also, the shapefile-js library can only handle pretty small Shapefiles. If I integrate this into OpenLayers, I think, long term, using a Web Worker thread to parse the Shapefile would be wise (which is another challenge to direct OpenLayers integration).

**EDIT 2011-12-13 22:36 -0800:** I tested the donut polygon case.
