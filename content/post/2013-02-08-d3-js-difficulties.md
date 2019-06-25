---
title: D3.js difficulties
author: Karl Broman
date: '2013-02-08'
categories:
  - Programming
tags:
  - code
  - D3
  - javascript
  - programming
  - stupid
slug: d3-js-difficulties
---

I'm pleased with my progress learning javascript and [D3](https://d3js.org). (I'm actually writing [coffeescript](https://coffeescript.org) rather than javascript.)

But I spent a lot of time thrashing about yesterday, due mostly to two silly errors.

### Put the script in the body

First, I'd tried to make a [truly simple example](https://www.biostat.wisc.edu/~kbroman/D3/error1/error1.html), making just an SVG with a little rectangle.

````html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Put script in body</title>
    <script type="text/javascript"
        src="http://d3js.org/d3.v3.min.js"></script>

    <script type="text/javascript">
    var h=50;
    var svg = d3.select("body").append("svg")
                .attr("height", h).attr("width", h);
    svg.append("rect").attr("x", 0).attr("y", 0)
                .attr("height", h).attr("width",h);
    </script>
</head>

<body>
</body>
</html>
````

But this gives nothing.  You need to move the script from the `head` to the `body`, [as it is here](https://www.biostat.wisc.edu/~kbroman/D3/error1/error1b.html).  Then it works.

I don't really understand this.  Perhaps I should go back to my reading.

[**Update**: I think I've figured this out.  If you put the script in the `head`, the code gets run before the `body` exists, and so there's no `body` in which to append the SVG.  _Conclusion_: Put the link to your script at the very bottom of the html file.]

### Don't forget `enter()`

In D3, you bind data to a bunch of objects, and attributes of the objects can be controlled by features of the data.  I write code sort of like this:

````javascript
svg.append("g").selectAll("empty")
   .data(thedata)
   .enter()
   .append("rect")
   .attr("x", (d) -> start[d])
   .attr("y", pad.top)
   .attr("width", (d) -> end[d] - start[d])
   .attr("height", (d) -> hInner)
   .attr("fill", (d) -> color[d])
   .attr("stroke", "none")
````

My most common mistake so far: I forget the `.enter()` part.  You don't get a error message, but the objects don't get created.
