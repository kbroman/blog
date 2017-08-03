---
title: charset="utf-8"
author: Karl Broman
date: '2013-03-02'
categories:
  - Programming
tags:
  - D3
  - javascript
  - programming
slug: charsetutf-8
---

To use the latest version of [D3](http://d3js.org), you need to use `charset="utf-8"` in the call to `<script>`.

I'm giving a talk at [ENAR](http://www.enar.org/meetings.cfm) in just over a week, on interactive graphics.  My slides (still in preparation) are [on the web](http://www.biostat.wisc.edu/~kbroman/presentations/InteractiveGraphs2).

The slides were working fine locally on my laptop, but they weren't working on my web server...I was getting a syntax error regarding an illegal character.

I figured out that I needed to add `charset="utf-8"`, like so:

````html
<script charset="utf-8" type="text/javascript" src="js/d3.js">
</script>
````
