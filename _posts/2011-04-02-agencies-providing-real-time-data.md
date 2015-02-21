---
author: mattwigway
date: '2011-04-02 00:14:40'
layout: post
slug: agencies-providing-real-time-data
status: publish
title: Agencies Providing Real-Time Data
wordpress_id: '4'
tags:
- list
- nextbus
- realtime
- transit
- transitappliance
---

<span class="warn-bar">
Note 2012-06-15: this page is now quite outdated.
</span>

As a part of the [Transit Appliance Project](http://transitappliance.org), I've been evaluating what transit agencies have real-time data; here's a (non-exhaustive) list, focused primarily on U.S. agencies (note: these are only agencies that provide an API, not any agency with a real-time feed):

	
- [TriMet,](http://trimet.org) Portland, OR, custom JSON\[-P\] feed, XML may also be available. GTFS-realtime is also available.
- [San Francisco Muni](http://sfmta.org), via [NextBus](http://nextbus.com).
- [Bay Area Rapid Transit (BART)](http://bart.gov), San Francisco, CA, custom XML feed. Their [Google Group](http://groups.google.com/group/bart-developers) is very responsive and helpful. GTFS-realtime is also available.
- [AC Transit](http://actransit.org), Oakland, CA, via [NextBus](http://nextbus.com).
- [Los Angeles Metro](http://metro.net), both via [NextBus](http://nextbus.com) and a custom XML API.
- [Unitrans](http://unitrans.ucdavis.edu), Davis, CA, via [NextBus](http://nextbus.com). Their GTFS is hosted by Sacramento RT.
- [MBTA](http://mbta.com), via [NextBus](http://nextbus.com). They have a GTFS at [http://www.eot.state.ma.us/developers/](http://www.eot.state.ma.us/developers/) that has stop ids to match NextBus. They have a trial up for rail arrivals.
- [Transport for London (TfL)](http://tfl.gov.uk), custom XML API.
- [Washington Metropolitan Area Transit Authority (WMATA)](http://www.wmata.com), custom XML/JSON\[-P\] API; has real time arrivals for rail, but only positions for buses (no arrivals).
- [DC Circulator](http://dccirculator.com), via [NextBus](http://nextbus.com). I couldn't find any public GTFS.
- [Chicago CTA](http://transitchicago.com), custom XML API for buses, no arrival data for trains yet.


I know that there are a ton that aren't on here; as I do more research, I'll put more up.
