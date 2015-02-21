---
author: mattwigway
layout: post
title: Using GeoTools with Multiple User Accounts
---

I have a situation where I have multiple GeoTools applications being run on a server by different users. I was having a lot of issues with exceptions about not being able to decode CRS codes, even though I was sure I had the [`gt-epsg-hsql`](http://docs.geotools.org/latest/userguide/library/referencing/hsql.html) file included in my JAR, and had [set up Maven correctly](http://docs.geotools.org/stable/userguide/build/faq.html#how-do-i-create-an-executable-jar-for-my-geotools-app) to include the dependency.

It turns out the issue was that the `gt-epsg-hsql` extracts its hsql database of projections to `Geotools` in the system temporary directory, and if there are multiple geotools apps running as different users, the first one to start gets the directory, and the remaining ones crash because they don't have permissions to access it.

The workaround is to use separate temporary directories for each user. The easy way to do this is <code>TMPDIR=&#96;mktemp -d&#96; application</code>, which creates a new unique temporary directory each time an application is started.
