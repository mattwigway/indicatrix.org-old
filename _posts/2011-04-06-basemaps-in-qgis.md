---
author: mattwigway
date: '2011-04-06 16:36:02'
layout: single-post
slug: basemaps-in-qgis
status: publish
title: Basemaps in QGIS
wordpress_id: '21'
tags:
- bing
- gis
- google
- maps
- opensource
- openstreetmap
- qgis
- webmapping
- yahoo
---

**Update 2012-02-02 17:57 -0800:**I just wrote a post about [another way to do this](/2012/02/02/more-basemaps-in-qgis/).

I really like [QGIS](http://qgis.org). It's a powerful GIS that runs on Linux (among other operating systems) and doesn't require incredible amounts of CPU. One criticism I had of it was that it did not provide the same 'click-and-go' basemap experience one can get with ArcGIS for making simple maps (i.e. Add Basemap, select Bing, DeLorme, &c. and you're done). No more! Thanks to the [qgis-openlayers](https://github.com/pka/qgis-openlayers-plugin/) plugin available on GitHub, you can now use OSM, Google Maps, Yahoo Maps and Bing Maps as base layers in your project (side note: make sure you don't violate any copyrights by using them). <del>I've had a little trouble with the projections, but I'm not that good with dynamic reprojection in QGIS yet, so I'm sure it's my error.</del>; Unfortunately, the layers don't support reprojection, so your project is basically forced to use Google Mercator&emdash;which may be a showstopper but is often acceptable for quick maps (remember, QGIS can reproject your other layers). If you do want reprojection, see [this post](/2012/02/02/more-basemaps-in-qgis/).

It's pretty clever how the library works&emdash;it basically just renders an OpenLayers web page into the frame. It's raster and doesn't support an alpha channel, so this is pretty much just good for basemaps. If you have another OpenLayers basemap you'd like to use, implementing it is pretty simple&emdash;but that's a topic for another time.

Installation is simple in recent versions of QGIS&emdash;just go to Plugins -&gt; Fetch Python Plugins..., click 'Add 3rd Party Repositories' in the repositories tab, and search for and install 'OpenLayers Plugin' in the 'Plugins' tab. Restart QGIS, and find your new menu under Plugins -&gt; OpenLayers Plugin. Cool!
