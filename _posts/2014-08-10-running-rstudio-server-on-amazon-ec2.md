---
author: mattwigway
layout: single-post
title: Running RStudio Server on Amazon EC2
---

<img src="/img/2014/08/rstudio_server.png" alt="RStudio Server running on Amazon AWS, accessed via SSH tunneling">

[R](http://www.r-project.org) is a great environment for statistical computing; I've used it in
a [number](/2014/05/01/predicting-the-popularity-of-bicycle-sharing-stations/) [of](/2014/04/24/bikeshare-clustering/)
[projects](/2013/12/14/effects-of-space-and-time-on-bikeshare-use/). [RStudio](http://rstudio.com) is hands-down
the best IDE for R (there is even less debate here than there is about emacs being the best editor). Sometimes, though,
I find that I need to run analyses that require more computing power than my personal computer can provide (especially
since my desktop is currently in storage in California and I'm in Illinois with a circa-2007 netbook with 2GB of RAM).

[Amazon EC2](http://aws.amazon.com/ec2/) is a great solution for this type of issue; it allows you to spin up powerful
computers on-demand and access them over ssh. You don't get a graphical interface, though, which precludes running RStudio Desktop.
However, RStudio provides a server tool that allows you to run R on a server and access it through your browser. Configuring
it on EC2, however, is a wee bit tricky because most people use public key authentication to access their instances
(which is good for security), while RStudio assumes that you can log in with a password. One solution is to switch to
password authentication for your entire instance, but it's possible (and more secure) to keep the public key authentication.
Here's how to do it.

1. Spin up an EC2 instance. I like to use the ones from [Ubuntu Cloud](http://cloud-images.ubuntu.com/locator/ec2/).
2. You can now log in using your key pair like so: `ssh -i ~/.ssh/key.pem ubuntu@<aws-ip>`
3. Install a recent version of R from [CRAN](http://cran.r-project.org) by following the directions at http://cran.r-project.org/bin/linux/ubuntu/ (assuming you're on Ubuntu).
4. [Download RStudio Server](http://www.rstudio.com/products/rstudio/download-server/) and install it. You may need to replace `gdebi` with `dpkg -i` because X11 is not available.
5. Add the following like to `/etc/rstudio/rserver.conf`. This forces RStudio to listen only for connections on localhost, so that a public key is still needed to access it.
   www-address=127.0.0.1
6. Restart RStudio Server: `sudo restart rstudio-server`
7. Create a password for your login account: `sudo passwd your-user-name`. You won't be able to SSH in with this (assuming that you only allow public key auth), but you'll use it to
   log into RStudio.
8. On your local machine, run `ssh -N -L localhost:8787:localhost:8787 -i ~/.ssh/aws2.pem ubuntu@<aws-ip>`. This forwards the RStudio Server session securely to your computer using SSH tunneling.
   Note that any user of your local machine can now access RStudio Server, although they'll need the password you created in step 7.
9. Go to [http://localhost:8787/](http://localhost:8787/) and log in with the password you just created.
10. Analyze away.

Note that you are just accessing RStudio on AWS, so you'll need to have all of your data and R scripts on the server.
   



