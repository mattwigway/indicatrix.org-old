---
title: Pareto Surfaces and Urban Planning (or, why planning is hard)
author: mattwigway
---

Urban planning is the process by which society decides how our cities and regions will develop in the future.
As anyone who's been involved in a planning process can tell you, it is a very difficult field. I
argue that the reason for this is because there are no easy wins in plannng; we cannot improve outcomes in one
dimension without making them worse in another.

The theoretical underpinning of what I'm describing is known as [Pareto efficiency](https://en.wikipedia.org/wiki/Pareto_efficiency).
The gist is that you have multiple measures which you would like to minimize or maximize. A scenario is Pareto-efficient when you cannot
improve any measure of interest without making another measure worse. Consider a situation where you are interested in
both minimizing greenhouse gas emissions and maximizing the speed with which people can move. One solution is to have
no motorized transport at all, which clearly minimizes greenhouse gas emissions, although at a cost to the speed with which
people can move. One could also imagine a world in which everyone gets around by private helicopter. This clearly allows for extremely
high speed movement, but falls short on the goal of minimizing greenhouse gas emissions. In the first case, one cannot increase
speed of movement without making greenhouse gas emissions worse, while in the second case, one cannot decrease greenhouse gas emissions
without making movement slower. Both scenarios are Pareto-efficient. Of course, in between these extremes are many compromise solutions, for example pedestrian cities
with public transit, or high-speed trains between cities and districts within a city. These compromises are also Pareto-efficient:
we can't make the trains faster without increasing energy use and thus greenhouse gas emissions, and we can't reduce greenhouse gas emissions
without running fewer trains, causing the speed of movement to decrease. These optimal solutions form a tradeoff curve, showing for a given
level of greenhouse gas emissions what speed is possible.

<figure>
  <img src="/img/pareto/modechoice.png" />
  <figcaption>
    Different possible scenarios for transport systems. Walking emits very little greenhouse gas but is slow; helicopters
    emit large quantities of greenhouse gases but are very fast. Numerous compromise solutions exist, for example walkable cities with
    rapid transit. Other compromises exist and they lie along the curve, which represents the tradeoff between speed and greenhouse gas emissions.
    All scenarios on this curve are Pareto-efficient. There also exist scenarios that are not Pareto-efficient, for example everyone riding
    tractors to get around the city.
  </figcaption>
</figure>

Of course, one can come up with solutions that are not Pareto-efficient. One can imagine a scenario in which everyone has a farm tractor
that they use to get around. Farm tractors burn large amounts of fossil fuels, and they are slow. It's possible to both increase speed and
reduce greenhouse gas emissions (for example, by replacing the tractors with small cars, or rapid transit). Thus, the tractor solution is not
Pareto-efficient for the measures outlined above.

Suppose, though, that in addition to caring about greenhouse gas emissions and speed, we also cared about being able to cross large tracts of
unpaved land. This is a third dimension to the graph shown above, and now the tractor solution is one of the Pareto-efficient
solutions: it's better at crossing unpaved land than rapid transit, it's faster than walking, and it still has lower greenhouse gas emissions 
than helicopters.

This is the crux of why planning is hard. We care about many things, and we have to make hard choices to trade those things off. Planning
isn't an optimization problem that we can solve; there are many mathematically optimal (or Pareto-efficient) solutions given the measures we care about.
The examples so far have been contrived, but they don't have to be: planning is a messy, multidimensional problem. Consider the goals
of a typical regional transportation plan: decrease congestion, increase economic opportunity, decrease greenhouse gas emissions, accomodate growth, &c. Add to this all of the dimensions that may not be stated goals of the planning process but that some stakeholder
(be it a business, a member of the public, &c.) cares about, for instance not losing their view of the water, or not having a hard time finding parking in
front of their house, and you have a highly multidimensional problem. I would posit that the urban system we have is already Pareto-efficient when you
consider all of the various dimensions that someone cares about; any change to improve one dimension will harm another. Thus, the planning process is
about making a tradeoff between these dimensions.

Not recognizing this is what led us to the urban system we have today, at least in the US, with core cities decimated by freeways and exurbs sprawling
for literally hundreds of kilometers outside the city limits. Rather than recognizing the highly multidimensional (and, in some cases, orthogonal) goals of planning when we built this,
we deferred to the engineers (along with the oil and car companies) and built cities around the primary goal of increasing potential automobile throughput (along with demonstrating America's
economic prowess to the world). The idea that we can optimize
our way to a single planning solution is a dangerous fallacy, because all it means is that the process by which the decision about what dimensions are important
is hidden inside a black box of some sort.

I'll end with a note on evidence-based planning. More and more planning processes are evidence driven, and more and more measures are being created, for
outcomes as diverse as emissions and income inequality. Paradoxically, creating more measures will make planning harder, not easier, as more tradeoffs between
various values must be made. This isn't a bad thing; making decisions about which measures (and the outcomes they imply) are most valued is exactly the point
of planning, this is the reason planning is not a hard science, but instead a social science or even a humanity; many of the thinkers who have most informed
planning policy today come not from the sciences but from philosophy, design, or art---everyone from Jane Jacobs and Lewis Mumford 
to Plato. Evidence-based planning is great, as long as it spurs conversation about what measures
are important and the tradeoffs between them. But don't expect it to make our lives easier; indeed, quite the opposite.
