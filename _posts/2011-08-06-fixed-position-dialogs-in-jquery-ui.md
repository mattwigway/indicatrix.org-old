---
author: mattwigway
date: '2011-08-06 14:06:02'
layout: single-post
slug: fixed-position-dialogs-in-jquery-ui
status: publish
title: Fixed-position dialogs in jQuery UI
wordpress_id: '144'
tags:
- css
- dialog
- javascript
- jquery
- jqueryui
- wodget
---

I'm working on a project where there is a long, scrolling page and I wanted to have a dialog that is draggable and resizeable that does not scroll away when the user scrolls down. As far as I could tell, there is no option to do this with jQuery UI's [dialog](http://jqueryui.com/demos/dialog/) widget. But there is a quick workaround:

{% highlight javascript %}

dialogDiv.dialog().parent().css('position', 'fixed');

{% endhighlight %}

I use the parent because the dialog widget wraps the content in another &lt;div&gt; that contains the content and the other elements of the dialog box (title bar, &c.).

UPDATE 6 Aug. 2011:

If the dialog box is resizeable, you also need to reset the position each time it is resized:

{% highlight javascript %}
mapDiv.bind("dialogresize", function () {
    dialogDiv.parent().css('position', 'fixed');
});
{% endhighlight %}
