---
title: Accessibility Analysis with Python and OpenTripPlanner
author: mattwigway
layout: single-post
---

<figure class="pull-left" style="width: 355px">
  <img src="/img/2014/11/chicago.png" />
  <figcaption>
Walking time to the nearest grocery store for all Census blocks in Chicago.
  </figcaption>
</figure>

[OpenTripPlanner](http://www.opentripplanner.org) is a great bit of software for
both [customer-facing tools](http://ride.trimet.org) and
[analysis](/2013/06/20/microaccessibility-with-opentripplanner/). Until recently, it had the
capability to perform batch queries, calculating an origin-destination matrix or an aggregate measure of
[accessibility](http://www.vtpi.org/tdm/tdm84.htm). Configuring this functionality, however, was somewhat
awkward, as it used a verbose XML format that was more suited to allowing developers to configure application
components than as a user-facing interface (and I say that having been one of the last defenders of this approach
  on the OTP mailing list).

This batch analysis tool was removed as a side effect of a restructuring and simplification of the OpenTripPlanner
codebase that has been ongoing for several months. Its absence sparked
[a debate on the opentripplanner-dev mailing list](https://groups.google.com/forum/#!topic/opentripplanner-dev/tk427ITino0),
which broke down roughly into two camps: one camp arguing for something that is purely a configuration file, with
another camp arguing for "configuration files" that are simply scripts of some sort (I argued for both camps at
  one point or another). Where that conversation lies now, to make a long story short, is that there are tentative
  plans to rebuild Batch Analyst using Java Preferences as a configuration file format.

In parallel with this development, development has been ongoing on a
[web-based analytics framework](https://github.com/conveyal/analyst-server). This is a very useful (and just plain
  neat) tool for accessibility analysis in a graphical user interface driven package. This is exactly what is needed
  for probably the majority of those doing accessibility analysis. However, coming from a research background
(quantitative/computational geography), I often want tools that I can script, commit my methods to a git repo,
and integrate with other tools. That said, work on this graphical interface to Analyst has driven a rethinking
of how analysis is done in OTP and the creation of many useful components.

In some personal projects, I needed to be able to run batch jobs again, and I decided to try to build a quick and dirty
Python library to call the OTP analysis functions. (To be fair, integrating OTP and Python was originally proposed by
  Tuukka Hastrup in the aforementioned thread). The result is
[here](https://www.github.com/mattwigway/opentripplanner-jython). It's a [Jython](http://www.jython.org/) library
that wraps up the functionality of OTP's analysis functions in a hacker-friendly library. I decided to take a simple
approach and build a library that does one thing and one thing well: creates origin-destination matrices. What you
build around that is up to you. If you want a simple cumulative accessibility measure, you can sum the number of links
that are below a threshold. If you want to use a more complicated accessibility measure, with distance decays and such,
you can just implement some Python code to do that.

The map above is the result of a demonstration of this project. It shows the walking time to the nearest grocery store
from every Census block in Chicago. Here's how I made it. First, I downloaded the binary
distribution of OTP's master (development) version from [here](http://dev.opentripplanner.org/jars/). I grabbed
OpenStreetMap data for Chicago from [mapzen's metro extracts](https://mapzen.com/metro-extracts) site, and Census blocks
and grocery store locations from the [City of Chicago Data Portal](https://data.cityofchicago.org/). I built an OTP
graph using the standard methods. I then edited the grocery stores file to have only latitude and longitude columns
(because, internally, OTP seems to try to convert the other columns to integers for use as inputs to aggregators).
I then ran [this code](https://gist.github.com/mattwigway/15c2d7dc64901f0f3cc5) to perform the analysis. It must be run
in Jython as opposed to standard Python, the OTP jar must be on the Jython classpath, and the opentripplanner-jython module
must be in Jython's Python search path somewhere. I ran it like so:

    CLASSPATH=~/opentripplanner/otp-latest-master.jar jython accessibility.py

I'll walk you through what the code does. It loads the graph which was previously built (which it expects to find
  in the graph subdirectory of the working directory), loads the destinations, links them to the graph, creates a batch
processor with the origins, and then evaluates that batch processor on the destinations. The result of the call to
BatchProcessor.eval() is an origin-destination matrix, with origins on the rows and destinations on the columns. Unfortunately,
numpy is not available in Jython, so data is returned using the opentripplanner.batch.Matrix class.

This tool helps eliminate a lot of the repeated computation in classic batch analyst runs. You load the graph only once,
for example, and you could link the destinations only once if you were running the batch processor multiple times,
say with different mode sets. You could calculate travel times to multiple destination sets without re-running the batch
processor, but by simply calling eval() more than once. Remember that adding additional destinations, or calculating
accessibility for additional sets of destinations, is cheap; you're just sampling points in the graph. Adding additional
origins is expensive: for each origin, OTP builds a shortest path tree.

Under the hood, it uses the new Analyst framework, which calculates the travel time from each origin to every vertex
in the graph and stores it in a time surface, which we can then sample inexpensively.

One caveat is that this library doesn't yet support
[profile routing](https://github.com/opentripplanner/OpenTripPlanner/issues/1328), although OTP does. Profile routing
is a much better way of doing general accessibility analysis for general queries for public transportation (e.g. how long does it take to get to work)
versus extremely specific queries (if I leave _right now_, how long _exactly_ will it take me to get to work _today, right now_).
