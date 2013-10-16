---
author: mattwigway
layout: single-post
slug: microaccessibility-with-opentripplanner
status: publish
title: Microaccessibility with OpenTripPlanner
---

Analysis of [accessibility](http://www.vtpi.org/tdm/tdm84.htm) is
generally undertaken in large regions, such as
[metropolitan areas](http://hdl.handle.net/1721.1/32414) or
[entire countries](http://dx.doi.org/10.1080/00045608.2012.689240). Frequently
it also uses macro temporal scales, as in before-and-after
analysis. This analysis instead looks at micro scales, both spatial
and temporal. The study area is the
[University of California, Santa Barbara campus and the adjoining student community of Isla Vista](http://www.openstreetmap.org/?lat=34.41272&lon=-119.85839&zoom=15&layers=M).

I analyzed accessibility at every hour of a typical week, so that
accessibility can be compared at different times of day and on
different days. This has been done before, looking at
[accessibility at different times of day](http://www.scag.ca.gov/modeling/pdf/ABM/ABMreport01_Overview.pdf#page=8)
(page 8) in the Los Angeles area. I used tighter temporal scales (one
hour instead of four chunks) and also analyzed accessibility over the
entire week to allow the discernment of weekly cycles.

Only accessibility to eateries was analyzed. Data were obtained from
[OpenStreetMap](http://www.openstreetmap.org) for network data and
from the [UCSB Interactive Campus Map](http://map.geog.ucsb.edu) for
data on eatery locations. Animations of accessibility over a typical
week follow; in the darker blue areas more eateries are accessibile
within five minutes' travel time. Five minutes was chosen as the
cutoff because it is half of the walking time between the intersection
of Pardall and Embarcadero Del Norte and the front of the University
Center, two areas where many eateries are concentrated. A more
systematic study would need to estimate this from travel
data. Acessibility was analyzed for both walking and cycling.

<figure>
  <iframe width="853" height="480"
  src="https://www.youtube-nocookie.com/embed/jrZURxZrJaU?rel=0"
  frameborder="0" allowfullscreen="yes"></iframe>
  <figcaption>Accessibility to eateries at different times of day by
  walking.</figcaption>
</figure>

<figure>
  <iframe width="853" height="480"
  src="https://www.youtube-nocookie.com/embed/PTEvVajxdbc?rel=0"
  frameborder="0" allowfullscreen="yes"></iframe>
  <figcaption>Accessibility to eateries at different times of day by
  walking</figcaption>
</figure>

The two animated maps show the accessibility to eateries at different
times of day by different modes. The bicycle map shows much more
accessibility because with a bicycle one can reach many more
opportunities in 5 minutes' time. A daily cycle can easily be
determined, with most (but
[not all](https://www.google.com/search?q=freebirds+world+burrito+isla+vista))
businesses closing in the late evening and opening again in the
morning, creating a pulsing accessibility. The eateries on campus (the
eastern portion of the maps) do not have the same span of service as
the eateries in Isla Vista. On the weekends, most of the campus
eateries are not open at all.

There are a few limitations. OpenTripPlanner's cycling mode currently
[does not support bicycle parking](https://www.github.com/openplans/OpenTripPlanner/issues/865);
at UCSB, there are many bicycle parking areas where one must park
before going to one's building. At a micro scale of analysis,
correctness of the network is also very important because small
absolute errors can be large relative to the total length of the trip;
OpenStreetMap data was improved for this project but is still not
perfect, especially given construction on campus.

Further research would use behavioral data to better estimate
parameters for the accessibility measure, as well as to interpret the
results. [Sara Matthews analyzed mode choice](http://hdl.handle.net/10211.2/2930)
in trips to Humboldt State University in the context of residential
location. Accessibility could be used as a independent variable in a
similar analysis of mode choice.

Even in the context of comprehensive transportation models such as
SimAGENT
([Southern California Association of Governments](http://www.scag.ca.gov/))
and SF-CHAMP
([San Francisco County Transportation Authority](http://www.sfcta.org/)),
accessibility measures rendered as maps such as these are
valuable. They are understandable and thus can easily be presented to
non-technical decisionmakers and to the public. They also generally
have more of a descriptive rather than projective role; that is, they
describe current situations rather than predicting future
ones. Finally, they can play a role in individual decision support;
[Jarrett Walker has noted the usefulness of isochrones](http://www.humantransit.org/2012/11/the-need-for-maps-of-your-freedom.html)
for decision support, and these accessibility measures can play the
same role. Walk Score® has
[recently announced understandable accessibility maps](http://blog.walkscore.com/2013/04/choicemaps-new-way-to-measure-neighborhoods/);
this makes these types of measures much more available.

For a more in-depth treatment, see [the full report](/publications/2013/Conway-Accessibility-UCSB.pdf).

<div class="boilerplate">

Special thanks to Dr. Konstadinos Goulias and Jae Lee in the
<a href="http://www.geog.ucsb.edu/geotrans/">GeoTrans lab</a> at UCSB, and to
Bryan Karaffa in the
<a href="http://geog.ucsb.edu">UCSB Department of Geography</a>

Map data © <a href="http://www.openstreetmap.org">OpenStreetMap</a>
contributors. Eatery data ©
<a href="http://map.geog.ucsb.edu">UCSB Interactive Campus Map</a>.

These maps and analyses are the result of a research project and
should not be used for decision support without additional consultation.

</div>
