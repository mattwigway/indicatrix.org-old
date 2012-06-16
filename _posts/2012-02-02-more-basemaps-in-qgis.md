---
author: mattwigway
date: '2012-02-02 17:55:11'
layout: single-post
slug: more-basemaps-in-qgis
status: publish
title: More Basemaps in QGIS
wordpress_id: '270'
tags:
- basemaps
- gdal
- qgis
- tiles
- tms
---

One of the more popular posts on this blog has been my piece on [adding basemaps to QGIS](/2011/04/06/basemaps-in-qgis/). While the OpenLayer plugin is great, one of the things that I find dissatisfying is that it requires reprojecting your data to match the EPSG:3857 basemap. I often work in State Plane, and I'd just as soon have my data stay in that projection, which will also minimize local distortion. Well, as it turns out, one can add tiled map services as GDAL raster layers, with all the benefits that entails (e.g. reprojection). What you need to do is create an XML file like the following (which is lifted almost verbatim from [the GDAL website](http://www.gdal.org/frmt_wms.html), specifically [this file](http://www.gdal.org/frmt_wms_openstreetmap_tms.xml)):

{% highlight xml %}
<GDAL_WMS>
  <Service name="TMS">
    <!-- note: if you use this file verbatim, you *must* credit MapQuest and OpenStreetMap! -->
    <ServerUrl>http://otile1.mqcdn.com/tiles/1.0.0/osm/${z}/${x}/${y}.png</ServerUrl>
  </Service>
  <DataWindow>
    <UpperLeftX>-20037508.34</UpperLeftX>
    <UpperLeftY>20037508.34</UpperLeftY>
    <LowerRightX>20037508.34</LowerRightX>
    <LowerRightY>-20037508.34</LowerRightY>
    <TileLevel>18</TileLevel>
    <TileCountX>1</TileCountX>
    <TileCountY>1</TileCountY>
    <YOrigin>top</YOrigin>
  </DataWindow>
  <Projection>EPSG:3857</Projection>
  <BlockSizeX>256</BlockSizeX>
  <BlockSizeY>256</BlockSizeY>
  <BandsCount>3</BandsCount>
  <Cache/>
</GDAL_WMS>
{% endhighlight %}

Change the ServerUrl to your Tiled Map Service server (this one is for MapQuest Open Tiles), then go into QGIS, Layer-&gt;Add Raster Layer and select the XML file.

A few caveats:

  * The OpenLayers plugin automatically adds the required attributions, at least for OSM. This can be nice or not—nice in that you don't have to remember to add the attribution, not so nice in that you can't choose where to place the attribution; it's always in the lower-right.	
  * Reprojecting layers with text may yield strange skewing and distortion.	
  * You need to be sure that you use these services legally (as you did with OpenLayers plugin).

Have fun!

You can also convert tiles to GeoTIFF using gdal_translate, but I suspect most TMS providers would prefer you didn't.
