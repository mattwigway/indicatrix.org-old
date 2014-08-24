---
author: mattwigway
layout: single-post
title: "Predicting the Popularity of Bicycle Sharing Stations: An Accessibility-Based Approach"
---

<img src="/img/2014/05/bikeshare.jpg" alt="Bay Area Bike Share bicycles in Palo Alto" />

I presented a paper about modeling the popularity of bikesharing
stations at the
[California Geographical Society](http://www.calgeog.org) 2014 annual
meeting in Los Angeles. I calculated accessibility measures to jobs
and residents using Census and OpenStreetMap data and the open-source
[OpenTripPlanner](http://www.opentripplanner.org) network analysis
suite. I used those as independent variables in regressions to try to
explain the popularity of bikesharing stations. I used bikeshare
popularity data from
[Washington, DC](http://www.capitalbikeshare.com),
[San Francisco](http://www.bayareabikeshare.com), and
[Minneapolis--St. Paul](http://niceridemn.org). The main goal of the
modeling is to build models of station popularity that can be
transferred from one city to another, and thus used as planning tools
for new bikeshare systems.

I initially tried linear regression, using best-subset selection to
choose a subset of the accessibility measures as predictors;
ultimately only one variable, the number of jobs within 60 minutes of
the station by walking and transit, was used. I used a
log-transformed response to control heteroskedasticity. This
model predicted fairly well (<i>R^2</i> = 0.68), but it doesn't transfer
well (test <i>R^2</i> = 0.31 in Minneapolis/St. Paul and -0.15 in San
Francisco, indicating that the model produces more variability rather
than explaining any). The residuals were spatially autocorrelated in
all of these models, with [Moran's](http://en.wikipedia.org/wiki/Moran%27s_I) \\(I \approx 0.5\\).

Next I tried
[random forests](http://www-bcf.usc.edu/~gareth/ISL/ISLR%20First%20Printing.pdf#page=335&zoom=auto,-161,666), which
seemed like a good choice because they tend to perform well in
situations with highly-correlated variables, which is the situation we
have--all of the accessibility measures are strongly correlated. The
random forest fit the Washington, DC data considerably better than the
linear model did (<i>R^2</i> = 0.84), but again transfer performance was
rocky. _I_ has been reduced to being not statistically significant in
DC. When transferred, _I_ is lower than with the linear model in San
Francisco, but higher in Minneapolis. Ultimately, I suspect that the
random forest model is too flexible and is fitting the Washington, DC
data too closely.

The models are also likely misspecified. They include accessibility
only to jobs and residents, but
[bikeshare is used for many purposes other than going to work](http://capitalbikeshare.com/assets/pdf/CABI-2013SurveyReport.pdf#page=43&zoom=auto,-74,736),
and thus many more accessibility measures should determine the
popularity of a station. However, additional accessibility measures
are likely to be highly correlated with those already present, which
increases the variance of the coefficients and decreases their
_t_-statistics and statistical significances.

Based on all of this, it seems like we need to pursue models that are
inflexible and work well with highly-correlated predictors. Two that
seem to fit the bill are [ridge regression](http://www-bcf.usc.edu/~gareth/ISL/ISLR%20First%20Printing.pdf#page=230&zoom=auto,-161,605) and [principal components
regression](http://www-bcf.usc.edu/~gareth/ISL/ISLR%20First%20Printing.pdf#page=245&zoom=auto,-161,238). Ridge regression works by shrinking coefficient estimates
towards zero, introducing some bias but also reducing the
variance. Principal components regression works by creating _k_
principal components and using them as predictors in a regression. A
principal component is the vector along which the data vary the
most. With highly-correlated variables, a small number of principal
components can capture most of the variation in the data. Both of
these methods represent decreases in flexibility over ordinary linear
regression. Applying these types of models is a topic for future
research.

Ultimately, the results of this study are mixed. There is a
significant connection between accessibility and bikeshare station
popularity. The models predict fairly well in Washington, DC, the city
for which they were fit, but do not transfer well. For a model to be
useful as a new-system planning tool, it needs to transfer not only in
form but also in parameters. However, future research with additional
accessibility measures and inflexible statistical techniques seems
promising.

For a more in-depth treatment, see
[the full paper](/publications/2014/Conway-Bikeshare-Accessibility.pdf). The
[slides](/publications/2014/Conway-Bikeshare-Accessibility-slides.pdf)
from the conference presentation are available as well. I
would like to thank
[Kostas Goulias](http://www.geog.ucsb.edu/people/faculty/kostas-goulias.html) in the
[UCSB Department of Geography](http://geog.ucsb.edu) for his help with this project. I would also like to thank
[Eric Fischer](https://www.flickr.com/photos/walkingsf) for his
assistance with San Francisco bikeshare data. Any errors that remain are, of course, mine.

_Update (May 4, 2014)_: I uploaded a new copy of the paper with a few corrections:

- I added a note about OpenTripPlanner as beta software (p. 4)
- I added a note about the units of the accessibility variables (p. 8)
- I added a description of the coefficients of the fit model (p. 8)
- I added a footnote about sampling (p. 8f)
- I added a note about how the San Francisco linear model has been flattened (p. 13)
- I added legends to maps that were missing them (pp. 16-21)

_Update (August 24, 2014)_: The San Francisco accessibility measures were incorrectly calculated using California State Plane Zone 5 instead of Zone 3 projection. It is not believed that this introduced a significant amount of error, in relation to other sources of error such as geographic aggregation by centroid.
