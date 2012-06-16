---
author: mattwigway
date: '2011-07-30 18:08:08'
layout: single-post
slug: using-postgis-views-for-geoprocessing
status: publish
title: Using PostGIS Views for Geoprocessing
wordpress_id: '141'
---

Here's an efficiency improvement I've recently come up with. I've been working in QGIS on a hypothetical shuttle routing scenario, and one of the things I've come up with to improve my efficiency is running my geoprocessing on-the-fly in PostGIS. Rather than run a buffer operation in fTools every time I change the routing (and then load the result to PostGIS), I simply created this view in my PostGIS database for the project:

{% highlight sql %}
SELECT routes.gid, routes.agency_id, routes.route_short_name,
       routes.route_long_name, routes.route_desc, routes.route_url, routes.route_type,
       routes.route_color, routes.route_text_color, routes.agency_name, routes.potential,
       st_buffer(routes.the_geom, 400)
   AS the_geom
   FROM routes;
{% endhighlight %}

Now, as I'm editing, the buffer around the route automatically updates whenever I save. I had to project to a coordinate system because ST_Buffer uses SRID units for its buffer distance (I used a State Plane Coordinate System, with meters as the units). The query is pretty quick; I use an older P4 2.8GHz with 4GB of RAM as my primary GIS machine, and it calculates in under a second (the table is pretty simple, though). I run my Postgres server and QGIS on the same machine.
