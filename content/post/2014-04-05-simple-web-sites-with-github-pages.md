---
title: Simple web sites with GitHub Pages
author: Karl Broman
date: '2014-04-05'
categories:
  - Academics
  - Programming
tags:
  - github
  - websites
slug: simple-web-sites-with-github-pages
---

If you love [git](https://git-scm.com) and [GitHub](https://github.com), you'll also love [GitHub Pages](https://pages.github.com), for producing websites using [Markdown](https://daringfireball.net/projects/markdown/) and [git](https://git-scm.com): you write pages in Markdown within a `gh-pages` branch in a git repository; when you push to GitHub, a corresponding site is automatically constructed.

<!-- more -->

Last night, I wrote a [minimal tutorial](https://kbroman.org/simple_site) on how I've been using this (for example, for the website for my [R/qtlcharts package](https://kbroman.org/qtlcharts), on interactive graphics for QTL data).

In the tutorial, I wrote:

<blockquote>(For example, I don't like how simple code is rendered in red within a gray box. Ultimately I'll try to figure out how to change that, but for now I just pretend that I like it that way.)</blockquote>

But this morning, I figured out how to change that: create [my own css file](https://github.com/kbroman/simple_site/blob/gh-pages/assets/themes/twitter/css/kbroman.css) with the following code:

````
code {
  padding: 0;
  font-size: 90%;
  color: black;
  background-color: white;
  border: 0px solid white;
}
````

And then [add a line](https://github.com/kbroman/simple_site/blob/gh-pages/_includes/themes/twitter/default.html#L20) to the [`default.html`](https://github.com/kbroman/simple_site/blob/gh-pages/_includes/themes/twitter/default.html) file.
