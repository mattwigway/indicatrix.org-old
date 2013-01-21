---
author: mattwigway
layout: single-post
slug: a-simple-model-of-automobile-travel-time
status: publish
date: '2012-09-15 01:37:00-0700'
title: A Simple Model of Automobile Travel Time
---

For some personal research I'm working on, I'm using [OpenTripPlanner](http://opentripplanner.org) for automobile routing. I've already applied speed limits to the routing algorithm, but that's only part of accurately modeling automobile travel time. While for a cyclist or a pedestrian, the amount of time spent actually moving at full speed may be the lion's share of their journey, for an automobile this is not true. Especially in city traffic, it's likely that a large part of the time is spent waiting at intersections, accelerating, or moving through congestion (or _not_ moving through congestion).

Also, automobiles have large turn costs in some cases; turning left at a busy intersection (in a country where driving occurs on the right) may have a large cost associated with it. In contrast, a pedestrian can choose the side of the street he or she wishes to walk on. Even a cyclist has some flexibility at a large intersection; he or she can dismount and choose to cross as a pedestrian in two straight lines rather than making a left turn.

Finally, the widely variable environments in which automobiles can operate create different problems in routing. The biggest benefit of freeways is that they have no intersections; in many cases, the difference in speed limits between a {% units 65 mph %} freeway and a {% units 45 mph %} arterial street is insignificant because the freeway route is longer. 

I propose this as a general, very simple model for travel time, appropriate in a setting where the only data we have is the physical attributes of the streets and intersections (from [OpenStreetMap](http://openstreetmap.org)). However, it is also flexible enough to apply if there were more data.

$$ t\_{total} = t\_{distance} + t\_{intersection} + \Delta t\_{acceleration} + \Delta t\_{deceleration} + \Delta t\_{traffic} $$

\\( t\_{distance} \\) is just the lowest possible travel time based on the roads being traveled upon; for instance, if we travel {% units 25 miles %} on a road with a speed limit of {% units 25 mph %}, it will take at least an hour, without counting any other source of delays (assuming we obey the speed limit, which a trip planner must do). This is the simplest variable to calculate. Though it would probably not be a part of the initial model in OTP, this would be the place to figure in characteristics of the road itself. For example, many windy mountain roads (at least in California) have a posted maximum speed of {% units 45 mph %} or {% units 55 mph %}, but in actual practice there are many places where a motorist must slow significantly below this figure for safe driving.

\\( t\_{intersection} \\) is the time spent stopped at intersections, waiting for the light to change or waiting for traffic to clear. It can be estimated based on the intersection properties (whether there is a traffic light present, &c.) and probabilities; for instance, if there is a 35% probability that a motorist will be stopped by a traffic light on an arterial road, and if they are stopped the stop will average 30 seconds, \\( t\_{intersection} = (.35)(30)\\).

\\( \Delta t\_{acceleration} \\) and \\( \Delta t\_{deceleration} \\) are the _additional_ times that come from accelerating and decelerating to an intersection. For instance, if a car must decelerate to {% units 0 mph %} at an intersection and the road leading into and out of the intersection has a speed limit of {% units 45 mph %}, \\( \Delta t\_{deceleration} \\) would be the time it takes to decelerate from {% units 45 mph %} to {% units 0 mph %} _minus_ the time it takes to travel an equivalent distance at full speed, to avoid double-counting.

Finally, \\( \Delta t\_{traffic} \\) is delay from traffic. Calculation of this is highly data-dependent and could be implemented in OTP at a later date.

Now that I've layed out a generic model, I'll mention how it could be implemented in OTP. In OTP, \\( t\_{distance} \\) would be calculated by the edges in the graph when they are traversed, based on their max speed. All of the other variables would be calculated in in the intersection vertices, based on the speeds of the incoming and outgoing segments (to calculate acceleration; though the vertices do the calculation, the calculations are requested by the edges _after_ the vertices, once the full traversal pattern is known), the speed at which the intersection can be traversed (which is estimated based on incoming and outgoing speeds and turns, and may be 0 in the case of an expected stop), and the amount of delay present, based on whether there is a traffic light present and what kind of road it is in; for instance, the intersections between freeways and their ramps have 0 delay because they aren't really "intersections" in the usual sense of that word.
