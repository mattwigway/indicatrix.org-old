---
author: mattwigway
layout: post
status: publish
title: Analyzing the Effects of Space and Time on Bikeshare Use
---

Bikeshare systems [have been taking off in the US of late](http://dc.streetsblog.org/2013/08/30/the-american-bike-share-fleet-has-doubled-since-january/). One of the first of these systems, [Capital Bikeshare](http://capitalbikeshare.com/) in Washington, DC, has been in operation [since 2010](http://green.blogs.nytimes.com/2010/09/20/bike-sharing-expands-in-washington/). The automated bikeshare stations generate a wealth of information; the start and end stations and times of each trip are recorded, and are available [to the public in anonymous form](http://capitalbikeshare.com/trip-history-data). This project used the approximately 4.5 million trips taken on the system from the fourth quarter of 2010 until the second quarter of 2013.

I was interested in how space and time affect the usage patterns of bikeshare systems. This data allows one to test the patterns statistically.

It is generally acknowledged that patterns of bikeshare use differ at different times of day. This makes sense; for instance, commuters may ride downtown in the morning and back to a metro station in the afternoon. To test this, eight time periods were defined: morning (6a–9a), midday (9a–3p), afternoon (3p–7p) and overnight (7p–9p) for both weekdays and weekends. These time periods match those used in the [Metropolitan Washington Council of Governments travel model](http://www.
mwcog.org/transportation/activities/models/files/V2.3.52_Users_Guide_
v2_w_appA.pdf) and add weekends. Each trip was assigned to one of these time periods, and origin-destination matrices were computed for each time period. The labels were then scrambled (preserving the number of trips in each time period, as well as the origin-destination matrix of the entire dataset). Origin-destination matrices for each randomized time period were then recomputed. Pairwise comparisons of time periods were then computed for both the observed and simulated data.

There is a statistically significant difference between every time period and every other time period. That is, the patterns of bikeshare use differ at different times of day and on the weekends. This is a driver of rebalancing: the system operator must move the bikes to meet differing demands throughout the day. The other driver of rebalancing would be if there is a general trend for the bikes to move to a certain area regardless of time period; this study did not address this question but it could be addressed with the data used.

Some stations are, of course, more popular than others. As it turns out, the popularities of the stations are spatially autocorrelated---that is, nearby stations tend to have similar popularities. [Moran's _I_](http://en.wikipedia.org/wiki/Moran%27s_I) value is 0.78 (_p_ < 0.05). This is not surprising; one can hypothesize several reasons for this finding. The most obvious is that there are certain areas that are more popular than others (for instance, downtown stations are probably more popular than stations in lower-density residential areas). Also, bikeshare trips require both a start and end station; stations that are popular likely have many trips to nearby stations, making those stations popular as well.

Further research could include looking more into the patterns of use by time period, attempting to determine the general flow of bikes at different times of day. [One team has developed](https://github.com/dssg/bikeshare) statistical models to inform rebalancing, however, they modeled each station individually as the trip-level data used in this project is not available where they were working in Chicago. This origin-destination matrices could potentially improve this type of model.

This research was undertaken in [Dr. Stuart Sweeney](http://geog.ucsb.edu/~sweeney)'s Geography 172, Spatial Data Analysis, class in the [Department of Geography](http://geog.ucsb.edu) at [UCSB](http://www.ucsb.edu).
For a more complete treatment of the project, see [the full report](/publications/2013/Conway-Bikeshare-SpaceTime.pdf).