---
author: mattwigway
date: '2011-05-28 21:57:18'
layout: single-post
slug: installing-qgis-1-7-on-fedora
status: publish
title: Installing QGIS-1.7 on Fedora
wordpress_id: '84'
tags:
- '1.7'
- dev
- fedora
- qgis
- qgis1.7
---

The [QGIS instructions](http://www.qgis.org/wiki/Building_QGIS_from_Source#Building_QGIS_with_Qt_4.x) for building from source are targeted at Ubuntu, but they translate fairly well to Fedora. Here's a quick guide:

Instead of preparing apt as they say, use yum or Package Manager to install these packages:
	
- cmake
- bison
- flex
- grass-devel
- geos-devel
- PyQt4-devel
- gsl-devel
- qwt-devel
- gdal-devel


There may be few that I already had installed on my system and missed; if you run configure below and find missing dependencies, run yum search &lt;whatever&gt; in a terminal to look for it. Make sure you install any relevant -devel packages as well.

Check qgis out of their SVN server into the directory of your choice; I chose qgis-May28 in my software build directory.

    
    svn co https://svn.osgeo.org/qgis/trunk/qgis qgis-May28


cd into that directory and create a directory called build. cd into that.

QGIS is configured using CMake. Since we're compiling a development version, we want to use a prefix (installation directory) other than the default, for instance ~/qgis-1.7. The .. signifies that the sources are in the directory above the build directory.

    
    CMAKE_BUILD_PREFIX=~/qgis-1.7 ccmake ..


Run through the menus, you can probably accept the defaults. Press 'c' to configure QGIS. When that's done, press 'g' to generate the Makefiles. Press 'q' to quit if ccmake doesn't exit automatically.

Build qgis:

    
    make


Wait a while. When it's done, install qgis with:

    
    make install


You may need to become root if the directory you chose as a prefix isn't writable by a normal user.

I used Fedora 13 to write this post.
