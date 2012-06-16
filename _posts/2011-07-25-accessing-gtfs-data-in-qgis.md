---
author: mattwigway
date: '2011-07-25 21:43:37'
layout: single-post
slug: accessing-gtfs-data-in-qgis
status: publish
title: Accessing GTFS Data in QGIS
wordpress_id: '133'
tags:
- bart
- gtfs
- gtfsdb
- postgis
- postgres
- qgis
- sql
---

When you load GTFS data into PostGIS using [gtfsdb](http://code.google.com/p/gtfsdb/), you can't access that data in QGIS because the tables don't have a primary key in int4 format (the primary key is in text format).

If your transit system uses numeric ids in text format, an easy fix is running this against each of your tables:

{% highlight sql %}
ALTER TABLE stops ADD COLUMN gid int;
UPDATE stops SET gid = stop_id::int;
ALTER TABLE stops ALTER COLUMN gid SET NOT NULL;
ALTER TABLE stops ADD CONSTRAINT stops_gid_uniq UNIQUE(gid);
{% endhighlight %}

What this does is creates an integer ID field, populates it with the stop_id (or shape_id, &c.) cast to an integer, then adds NOT NULL and UNIQUE constraints to the column. You can't add the constraints beforehand, because the column is initialized to NULL values. Remember you have to run these commands against every table you want to pull into QGIS directly, and remember to change stop_id to shape_id &c.

The advantage to this approach is that the gids are the same as the stop_ids. The disadvantage of this approach is that it doesn't work with systems like [BART](http://bart.gov) that have alphanumeric stop ids, like 'SHAY' or '24TH.' If your system has a few ids like '3104_A', don't worry that you won't notice them; Postgres won't cast that to a number but will throw an error like:

<pre>
ERROR:  invalid input syntax for integer: "3104_A"
</pre>

At least, that's what it did in Postgres 9.0.4.

**Update 2011-11-05:**

If your transit system has non-numeric IDs and you can't use the casting trick, you can create numerical IDs that are not tied to the Stop IDs like so:

{% highlight sql %}

ALTER TABLE <table> ADD COLUMN nid SERIAL;

{% endhighlight %}

Thanks, [underdark](http://underdark.wordpress.com)!
