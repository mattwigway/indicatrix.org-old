---
author: mattwigway
date: '2011-05-29 18:08:03'
layout: single-post
slug: changing-the-ownership-of-a-wordpress-blog
status: publish
title: Changing the Ownership of a WordPress Blog
wordpress_id: '97'
tags:
- ownership
- wordpress
---

Astute readers will have noticed that the author of this blog has just changed. Not to worry, it's just an alter ego! I was doing some housekeeping to keep my various unrelated blogs straight as I move away from my other one. Here's how I did it:

_By the way, it may be useful to use two separate browsers so that you can be signed into one WordPress account in each._



	
 1. Create a new WordPress account for the new blog owner by going to wordpress.com and clicking the orange 'Get started here' button. If you don't want to create a new blog but just a username, click the infinitesimally small 'Sign up for just a username' text under the username field. Fill out the fields (side note: if you only have one email address, and it's a Gmail address, you can trick WordPress.com into thinking you have a new email by adding a period to the address, e.g. if your address is johndoe@gmail.com, put in john.doe@gmail.com. You'll still get the emails at johndoe@gmail.com, but WordPress will think you have two emails.) If you already have the account you want to transfer the blog to, skip this step.	
 2. Click 'sign up.'	
 3. In the original account (user A), go to the blog's dashboard, and choose 'Add New -&gt; User' from the top bar. Enter the email address of the user you want to transfer the blog to (user B). If you used the period trick, enter the periods. Set 'Role' to 'Administrator.'	
 4. Click the confirmation link in the email that is sent to user B.	
 5. Go to the list of posts as user A. Click the first box to select all posts (I'm not sure if this is an issue if you have more posts than fit on one page; comments welcome).
 6. Under 'Bulk Actions' choose 'Edit', then click 'Apply'.
 7. Change author from --No change-- to the new administrator (this will make the new user the owner of all posts; if you have a multi-author blog, it'll take a little more doing and maybe some SQL trickery in the WordPress DB; as always, comments welcome). Click 'Apply'.
 8. If the author you are removing made any comments, you'll have to change the ownership manually. I just deleted my old comments and recommented as user B, but this will break threading on many blogs; perhaps there is another way that won't break threads. I had only made one comment anyhow.	
 9. As user A, go to [https://dashboard.wordpress.com/](https://dashboard.wordpress.com) and click My Blogs on the left. Hover over the blog you are moving, and choose 'Transfer Blog.' Check the box in the red warning. Enter user B's email (with the periods if applicable).	
 10. Open the confirm link in the email they send to user A. Make sure you do it in a browser where you are signed in as user A, not user B.	
 11. You're done!
