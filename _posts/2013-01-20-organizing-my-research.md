---
author: mattwigway
layout: single-post
slug: organizing-my-research
status: publish
title: Organizing my Research
---

As a follow-up to [my recent post about organizing my library]({% post_url 2012-12-31-organizing-my-library %}), this post talks about the system I've come up with for organizing my research.

I was starting a new research project, and I realized that writing my bibliography and managing my citations manually wasn't going to be good enough. I needed a reference manager of some sort. My librarian suggested I try [Mendeley](http://www.mendeley.com/), and it has become the core of my reference-management workflow.

Whenever I read a new work academically, I put it into Mendeley first and then I use the notes field in Mendeley to keep notes on the work. I use the Mendeley Desktop client for almost all my interactions with Mendeley; it's available for Linux, Windows and Mac OS X, so it should work for most users. I haven't used the PDF annotation feature much, but when I have I've found it pretty cool.

I split my references up into folders for each project, to better organize them.

I write my papers using [LaTeX](http://en.wikipedia.org/wiki/LaTeX) and manage bibliographies with BibTeX-format files. In the Mendeley Options dialog, I have enabled automatic BibTeX syncing, creating one BibTeX file per collection. I save these files to `~/texmf/bibtex/bib`, which is a global location for BibTeX files. I can then say `\bibliography{collectionName}` in any LaTeX file on my system and have it automatically import the citations from that Mendeley collection. Then I can use `\autocite`, `\printbibliography` and any other commands one would usually use to manage citations in LaTeX. One caveat is that your collection names cannot contain spaces; BibTeX doesn't support that.

Beyond that, when Mendeley syncs the BibTeX files, it also syncs the notes I've put in the notes field of each entry. This is really cool. I can then use a [LaTeX file like this](https://gist.github.com/4583664) to generate a PDF annotated bibliography (in MLA format) of a particular collection.

For web pages, I have [Zotero](http://www.zotero.org) installed inside [Firefox](http://www.firefox.com), and I import pages into that. I have Mendeley configured to automatically import citations from Zotero.

Finally, I've put [Scholarley](https://play.google.com/store/apps/details?id=info.matthewwardrop.scholarley) on my phone and set it to sync my Mendeley library so that I can look at my citations on the go. Unfortunately, I can't add works or take notes through the client (so no research on the bus), but I hope that will come out soon.