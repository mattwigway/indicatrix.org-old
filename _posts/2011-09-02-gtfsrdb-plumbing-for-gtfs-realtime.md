---
author: mattwigway
date: '2011-09-02 20:26:41'
layout: single-post
slug: gtfsrdb-plumbing-for-gtfs-realtime
status: publish
title: 'GTFSrDB: Plumbing for GTFS-realtime'
wordpress_id: '151'
tags:
- database
- gtfs
- gtfs-realtime
- sql
---

Over the last week I've started a new project, GTFSrDB, which allows you to connect [GTFS-realtime](http://code.google.com/transit/realtime/) with an SQL database, allowing app developers to use realtime data through SQL, just as easily as they use static data. Rather than worry about plumbing to connect GTFS and GTFS-realtime, they can focus on writing apps.

It accomplishes two primary tasks:



	
  1. Keeping a database up-to-date with the latest realtime data, and

	
  2. Archiving historic real-time data.




It's designed to work with [GTFSdb](http://code.google.com/p/gtfsdb/); it will coexist with static GTFS data in a database, so you can easily relate them. Keep in mind that if you update the GTFS data, you'll lose archived GTFSr data.




Here is an example query to find what stops have the largest delays (in seconds, for the TriMet system in Portland, OR):


{% highlight sql %}
SELECT stops.stop_id, stops.stop_name, stops.stop_lat, stops.stop_lon, stop_delays.avg
  FROM stops, stop_delays
  WHERE stops.stop_id = stop_delays.stop_id
  ORDER BY avg DESC;
{% endhighlight %}

The stop_delays view looks like this:

{% highlight sql %}
 SELECT stop_times.stop_id, avg(stop_time_updates.arrival_delay) AS avg
   FROM stop_time_updates, stop_times, trip_updates
  WHERE stop_times.trip_id::text = trip_updates.trip_id::text AND stop_times.stop_sequence = stop_time_updates.stop_sequence AND stop_time_updates.trip_update_id = trip_updates.oid
  GROUP BY stop_times.stop_id
  ORDER BY avg(stop_time_updates.arrival_delay) DESC;
{% endhighlight %}

(I had to pull in the trip_updates table for TriMet because they don't have a stop_id in their stop_time_updates; they instead specify trip_id and stop_sequence.)

(I've removed the lat and lon columns from the following table for readability)

{% highlight text %}
 stop_id |            stop_name            |         avg
---------+---------------------------------+----------------------
 10853   | Parkrose/ Sumner Transit Center | 473.8260869565217391
 7999    | NE 82nd & MAX Overpass          | 350.3050847457627119
 9610    | Willow Creek Transit Center     | 310.2352941176470588
 5846    | Tigard Transit Center           | 260.2093023255813953
 12849   | 16200 Block SW Langer           | 244.6111111111111111
. . .
{% endhighlight %}

The code is available [on GitHub](https://github.com/mattwigway/gtfsrdb). Address any questions to the email on that page or to the contact link, above.
