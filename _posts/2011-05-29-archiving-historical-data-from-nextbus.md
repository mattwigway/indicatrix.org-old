---
author: mattwigway
date: '2011-05-29 19:11:00'
layout: single-post
slug: archiving-historical-data-from-nextbus
status: publish
title: Archiving Historical Data from NextBus
wordpress_id: '82'
tags:
- avl
- opensource
- postgis
- python
- transit
---

It seems that everyone who analyzes historical [NextBus](http://nextbus.com) data has a different way of archiving their data. There are lots of ways one can use GIS to analyze this data, from creating movies showing the pulse of the transit system, to analyzing on-time performance, to finding bottlenecks. In that vein, I've created a short Python script that fetches NextBus data and puts it into a [PostGIS](http://postgis.org) database for analysis. You can download the latest version [here](http://avl2postgis.googlecode.com/svn/trunk/avl2postgis.py). Here's a rundown on options:



	
  * -a, --agency: the agency. Default sf-muni. This must be the NextBus agency name, e.g. lametro, actransit, mbta.

	
  * -t, --table: the PostGIS table to store the retrieved data in. Default nextbus.

	
  * -d, --dsn: the DSN for your database; documented [here](http://initd.org/psycopg/docs/module.html#psycopg2.connect).

	
  * -i, --interval: the interval at which to make requests to the NextBus service. Note that this is _not _the resolution of the data; only updated locations are stored, so -i 30 grabs the latest location for every bus that has changed location, every 30 seconds (but see the all-vehicles option, below).

	
  * --all-vehicles: causes positions for all vehicles to be fetched on each request, rather than only updated positions.

	
  * --no-deltas: usually, the data is put in with the actual time of the update from the GPS unit to NextBus's server, but this causes the data to be put in with the timestamp of when it was retrieved. Used in conjunction with --all-vehicles, this provides a 'snapshot' of the transit system every &lt;interval&gt; seconds.


The table should look like this:
{% highlight text %}
    
      Column   |         Type          |                       Modifiers            
    
    -----------+-----------------------+-------------------------------------------------------
     gid       | integer               | not null default nextval('nextbus_gid_seq'::regclass)
     agency    | character varying     | not null
     vehicle   | character varying     | not null
     direction | character varying     | not null
     heading   | integer               | not null
     route     | character varying     | not null
     time      | character varying(19) | not null
     the_geom  | geometry              |
{% endhighlight %}

The SRID should be EPSG:4326 (WGS84). As far as I know, all NextBus agencies provide latlong in WGS84 or NAD83 (EPSG:4269), which are close enough to be interchangeable in this case.

The date field is formatted as YYYY-MM-DD HH:MM:SS, to be compatible with the QGIS [Time Manager](http://www.geofrogger.net/trac/) plugin. The issue with the plugin is that buses tend to disappear (when the bus hasn't reported in the given time frame) or multiply (when the bus reported 2+ times).

For symbology, check out the new symbology implementatation in QGIS. Under Advanced-&gt;Rotation Field, you can choose the 'heading' field to make your icons rotate to the correct orientation.

The one known issue with the script is that the interval is not respected; the way the interval is implemented is that, after one request has completed, the script sleeps for the interval period. So if requests average 3s, the interval between requests is actually ~33s.

Adding additional AVL services shouldn't be hard; if you're interested in tackling this, take a look at implementing a function that looks like getDataFromNextBus and drop me a line (contact link under the header); we can add it.

I've licensed the code under the Apache License, version 2.0.

The requirements are pretty basic: you need Python, plus the pyquery library and psycopg2 libraries (both can be installed with easy_install).
