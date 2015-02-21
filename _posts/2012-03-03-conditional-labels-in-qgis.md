---
author: mattwigway
date: '2012-03-03 21:53:31'
layout: post
slug: conditional-labels-in-qgis
status: publish
title: Conditional Labels in QGIS
wordpress_id: '281'
tags:
- case
- conditionallabels
- expressionbasedlabels
- labels
- openstreetmap
- osm
- qgis
- sql
---

I fairly commonly find myself in a situation where I would like to display one label for certain features and another for other features in the same layer. QGIS doesn't have an official way to split labels up into categories, and until now I'd resorted to having two layers to render otherwise identical features. But, in the new, excellent [expression based labeling](http://woostuff.wordpress.com/2011/10/27/expression-based-labeling/) from Nathan Woodrow, I realized one can use an SQL CASE statement. For instance, one time I need to use two types labels is when labeling roads in OpenStreetMap: I want to use the name tag, _unless_ the feature has a ref tag defined (a name tag might be 'Capital City Freeway', while the ref tag would be 'US 50'). Here's how I solved that particular problem:

{% highlight sql %}
CASE
    WHEN ref IS NOT NULL THEN ref
    ELSE name
END
{% endhighlight %}

For now, anyhow, you'll need to be running the dev build of QGIS. Happy GISing!
