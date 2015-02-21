---
author: mattwigway
title: "Overanalyzing Board Games: Network Analysis and Pandemic"
layout: post
---

<figure>
  <img src="/img/2014/03/26/pandemic_board.jpg" /><br/>
  <caption>The _Pandemic_ board, 2nd ed. Copyright &copy; 2012 Z-Man Games</caption>
</figure>

I like board games, and one of my favorites is [_Pandemic_](http://en.wikipedia.org/wiki/Pandemic_%28board_game%29). The game consists of a board (pictured above) with a world map on it, with various cities highlighted, and a network between the cities. Disease breaks out randomly in the cities at the start of the game (using the shuffled infection deck) and then progresses using the same deck. Players cooperatively attempt to quell disease by moving between cities and treating disease. On each turn, players draw city cards; by collecting five of a particular color, they can cure a disease. Additional cards are drawn each turn from the infection deck to infect additional cities. Periodically, there are 'epidemics' in which the cards for the cities that have already been drawn are returned to the top of the infection deck. If a city is infected three times without being treated, and there is an additional infection, an 'outbreak' occurs and all of the cities connected to that city are infected.

The network is a major component of gameplay, so it seemed like network theory would be able to shed some light on a strategy for the game. I digitized the network from the game board using [Gephi](http://www.gephi.org). I then calculated the [Eigenvector centrality](http://en.wikipedia.org/wiki/Centrality#Eigenvector_centrality) and [degree](http://en.wikipedia.org/wiki/Degree_%28graph_theory%29) for each city using [NetworkX](http://networkx.github.io/). A machine-readable graph is [available for download](/download/pandemic.graphml).

Both degree and Eigenvector centrality are measures of centrality, that is how central a node is in the network. Degree is the simpler of the two; it is the number of connections (edges) each city (node) has. For example, Santiago is connected to only one city (Lima), so it has degree 1. Chicago is connected to five other cities (San Francisco, Los Angeles, Mexico City, Atlanta, and Montréal), so it has degree 5. The more other places a city is connected to, the theory goes, the more important it is.

Eigenvector centrality is a bit more complicated, but not much. As explained by [Wikipedia](http://en.wikipedia.org/wiki/Centrality#Eigenvector_centrality), the centrality of each node is the scaled sum of the centralities of the nodes around it. As it happens, this is also the eigenvector of the adjacency matrix, hence the name. This measure of centrality takes into account not only the number of connections of a city, but the number of connections of each of the cities it is connected to, and so on.

Degree and eigenvector centrality are both theoretically applicable to different parts of gameplay. Degree is most important for preventing outbreaks. Except in rare double outbreaks (when an outbreak in one city causes an outbreak in a connected city), the severity of an outbreak is defined by the degree of the city in which it occurs. If there have been three infections in a city with a high degree, the players would be wise to treat that city ASAP.

Eigenvector centrality is more useful for building research stations. Throughout the game, the players can build research stations, which have multiple uses. The most important from a graph-theoretic standpoint is that players can move from research station to research station as if there were an edge between them. Thus, cities with research stations are much more accessible to players. If research stations are built in cities with high eigenvector centrality, the number of cities that can be reached will be maximized (i.e., one could go to the research station, and then to an adjacent city, and then to another adjacent city; the possibilities are maximized with research stations in cities with high eigenvector centrality). There are caveats, of course; Bangkok and Hong Kong both have high eigenvector centrality, but it probably wouldn't make sense to build research stations in both cities as they are adjacent to each other.

<figure class="pull-right">
  <img src="/img/2014/03/26/centrality.png" /><br/>
  <caption>The two centrality measures are correlated</caption>
</figure>

The real question is whether this is useful for gameplay. Unfortunately I haven't played the game since I've made these calculations, but it initially seems that the centrality measures confirm what most players had already figured out: building research stations and treating disease is most important in the most-connected cities.

While most players don't think about (let alone calculate) eigenvector centrality during gameplay, they probably have thought about the degree of each city (if not by that name). As it turns out, degree and eigenvector centrality are fairly correlated (see scatterplot at right, made with [R](http://www.r-project.org); correlation coefficient 0.58), so simply looking at degree gives one a fairly good picture of the centrality of a city.

Realistically, these measures of centrality don't determine the absolute best strategy. Games tend to played out in a relatively small subset of the cities on the board, because each time there is an epidemic the cities already infected are placed back on the top of the deck to be infected again. Cities near the bottom of the deck rarely if ever come up. If there are no infections in Asia, it is likely not worth the effort to build research stations there despite the high centrality of many of the Asian cities. Building research stations is constrained by the cards each player has and the need to balance research station construction with other tasks such as treating disease.

One interesting pattern in the centralities is that Asian cities have very high centralities, while cities in the global South are much less central. This suggests that disease can spread much more rapidly in the Asian cities (although this is somewhat counterbalanced by increased ability to reach the Asian cities from each other). Gameplay is very different when focused on the Asian cities than when focused on the global South. I have noticed this in gameplay (infections in the South don't seem to cause as much trouble as other infections, though this is admittedly anecdotal). The centralities provide some theoretical justification for this observation.

One further analysis that could be undertaken would be to treat all research station-to-research station links as additional edges in the network, and determine which combinations of cities reduce the average shortest path distance between all pairs of nodes.

And finally, the centralities:

<table class="table table-condensed"><thead>
<tr><td>City</td><td>Eigenvector centrality</td><td>Degree</td></tr>
</thead><tbody>
<tr><td>Hong Kong</td><td>0.327</td><td>6</td></tr>
<tr><td>Bangkok</td><td>0.313</td><td>5</td></tr>
<tr><td>Chennai</td><td>0.285</td><td>5</td></tr>
<tr><td>Kolkata</td><td>0.272</td><td>4</td></tr>
<tr><td>Delhi</td><td>0.256</td><td>5</td></tr>
<tr><td>Ho Chi Minh City</td><td>0.252</td><td>4</td></tr>
<tr><td>Manila</td><td>0.231</td><td>5</td></tr>
<tr><td>Jakarta</td><td>0.225</td><td>4</td></tr>
<tr><td>Karachi</td><td>0.209</td><td>5</td></tr>
<tr><td>Baghdad</td><td>0.186</td><td>5</td></tr>
<tr><td>Taipei</td><td>0.182</td><td>4</td></tr>
<tr><td>Mumbai</td><td>0.173</td><td>3</td></tr>
<tr><td>Tehran</td><td>0.171</td><td>4</td></tr>
<tr><td>Shanghai</td><td>0.170</td><td>5</td></tr>
<tr><td>Istanbul</td><td>0.157</td><td>6</td></tr>
<tr><td>Cairo</td><td>0.144</td><td>5</td></tr>
<tr><td>Sydney</td><td>0.125</td><td>3</td></tr>
<tr><td>Riyadh</td><td>0.124</td><td>3</td></tr>
<tr><td>San Francisco</td><td>0.114</td><td>4</td></tr>
<tr><td>Algiers</td><td>0.111</td><td>4</td></tr>
<tr><td>Tokyo</td><td>0.097</td><td>4</td></tr>
<tr><td>Paris</td><td>0.096</td><td>5</td></tr>
<tr><td>Moscow</td><td>0.093</td><td>3</td></tr>
<tr><td>Los Angeles</td><td>0.088</td><td>4</td></tr>
<tr><td>Madrid</td><td>0.086</td><td>5</td></tr>
<tr><td>Chicago</td><td>0.080</td><td>5</td></tr>
<tr><td>Milan</td><td>0.075</td><td>3</td></tr>
<tr><td>Seoul</td><td>0.074</td><td>3</td></tr>
<tr><td>St. Petersburg</td><td>0.074</td><td>3</td></tr>
<tr><td>Essen</td><td>0.073</td><td>4</td></tr>
<tr><td>London</td><td>0.071</td><td>4</td></tr>
<tr><td>Mexico City</td><td>0.065</td><td>5</td></tr>
<tr><td>Osaka</td><td>0.064</td><td>2</td></tr>
<tr><td>Beijing</td><td>0.056</td><td>2</td></tr>
<tr><td>New York</td><td>0.055</td><td>4</td></tr>
<tr><td>Khartoum</td><td>0.047</td><td>4</td></tr>
<tr><td>Bogotá</td><td>0.045</td><td>5</td></tr>
<tr><td>Miami</td><td>0.043</td><td>4</td></tr>
<tr><td>Washington</td><td>0.041</td><td>4</td></tr>
<tr><td>São Paulo</td><td>0.040</td><td>4</td></tr>
<tr><td>Montréal</td><td>0.040</td><td>3</td></tr>
<tr><td>Atlanta</td><td>0.038</td><td>3</td></tr>
<tr><td>Lima</td><td>0.027</td><td>3</td></tr>
<tr><td>Lagos</td><td>0.025</td><td>3</td></tr>
<tr><td>Kinshasa</td><td>0.020</td><td>3</td></tr>
<tr><td>Buenos Aires</td><td>0.020</td><td>2</td></tr>
<tr><td>Johannesburg</td><td>0.015</td><td>2</td></tr>
<tr><td>Santiago</td><td>0.006</td><td>1</td></tr>
</tbody></table>
