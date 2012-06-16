---
author: mattwigway
date: '2011-05-25 13:53:47'
layout: single-post
slug: 1-2-3-mirror-modelling-in-inkscape
status: publish
title: '1-2-3: Mirror Modelling in Inkscape'
wordpress_id: '73'
---

The other day, I needed to draw a symmetrical object (a map point icon) in [Inkscape](http://inkscape.org), the wonderful free vector graphics editor. I was surprised to find that there is no symmetrical modeling feature, so I improvised. Here's how to create a symmetrical polygon in Inkscape:

<ol>
<li>
Draw half of the object, using the line tool (I know you want a polygon, but draw one side of the object as a line). If you want something that is symmetrical both horizontally and vertically, draw one quarter of the object. I suggest using a guide, so that you can get the ends of the line to be vertically aligned (for vertical symmetry, i.e. left and right) or horizontally aligned (for horizontal symmetry). Get the shape right, because once you create the polygon, the sides will no longer automatically mirror each other.<br/>

<img src="/a/2011-05-25-1-2-3-mirror-modelling-in-inkscape/mirror1.png" />

</li>
<li>
Copy the line you just made and paste (ctrl-alt-v, Paste in Place, may make it easier to line up later, although it will be invisible when first pasted because it will align perfectly with the original path) it into the document. Choose Object-&gt;Flip Horizontal or Object-&gt;Flip Vertical, depending on the axis of symmetry. Move the flipped object so that the ends line up (i.e. it forms a polygon). You can use the arrow keys to align it; holding Alt while using the arrow keys makes them move the object finely. If you are doing two-axis symmetry, create 3 copies and flip one horizontally, one vertically, and one both vertically and horizontally, then line it all up.<br/>

<img src="/a/2011-05-25-1-2-3-mirror-modelling-in-inkscape/mirror2.png" />

</li>
<li>
Use the paint bucket tool to fill the area contained by the lines. This will create a polygon that is symmetrical. You can now either delete the polylines or move them to a hidden layer if you think you'll need them again.<br/>

<img src="/a/2011-05-25-1-2-3-mirror-modelling-in-inkscape/mirror3.png" />
</li>
</ol>

