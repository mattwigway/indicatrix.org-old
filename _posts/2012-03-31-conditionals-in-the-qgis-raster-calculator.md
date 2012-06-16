---
author: mattwigway
date: '2012-03-31 21:28:35'
layout: single-post
slug: conditionals-in-the-qgis-raster-calculator
status: publish
title: Conditionals in the QGIS raster calculator
wordpress_id: '293'
tags:
- calculator
- conditionals
- gdal
- qgis
- raster
---

I needed to do some conditionals in the QGIS raster calculator, but it doesn't support that---or at least doesn't seem to. But it does support logical operators, with a result of either 0 or 1. For instance, here's the script I wrote:

<pre>
# Subtract them
((DavisQuad2012-02-25T16_00_00Z@1  -  DavisQuad2012-02-29T16_00_00Z@1)*
# Multiply by 1 if neither is 255 (NoData), 0 otherwise
(DavisQuad2012-02-25T16_00_00Z@1 != 255 AND DavisQuad2012-02-29T16_00_00Z@1 != 255))
# Subtract 32768 if either one was NoData, giving us -32768 for NoData.
-
(32768*(DavisQuad2012-02-25T16_00_00Z@1 = 255 OR DavisQuad2012-02-29T16_00_00Z@1 = 255))
</pre>


Of course, you can't actually put the comments in. But what it does is this: First, I subtract one raster from the other and multiply that by the logical operation that neither one contains NoData. That gives me the difference of the rasters, or 0 if either one contains NoData. Then I subtract 32768 multiplied by the inverse of the aforementioned logical operation, so any pixel with a NoData value in either of the original rasters is -32768 in the new one.

Note: I expanded on an idea from the GDAL [gdal_calc.py](http://trac.osgeo.org/gdal/browser/trunk/gdal/swig/python/scripts/gdal_calc.py) script.
