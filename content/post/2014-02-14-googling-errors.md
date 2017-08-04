---
title: Googling errors
author: Karl Broman
date: '2014-02-14'
categories:
  - Programming
  - R
tags:
  - computing
  - google
  - programming
slug: googling-errors
---

[@roguelynn](https://twitter.com/roguelynn) tweeted the other day:

{{< tweet 431321921909968896>}}

I had just talked about the technique in my [Tools for Reproducible Research](http://kbroman.github.io/Tools4RR/) course, and I had a few recent examples.

### Gtk-WARNING **: cannot open display:

I was logged into a department server, trying to clone a private repository from GitHub, and got an error like

    (gnome-ssh-askpass:1731): Gtk-WARNING **: cannot open display:

I googled that, and the first item was a [stackoverflow question](http://stackoverflow.com/questions/16077971/git-push-produces-gtk-warning), whose answer said "`unset SSH_ASKPASS`", which totally worked.

### except KeyError, k: raise AttributeError, k

AsciiDoc was giving me this error:

    asciidoc -a data-uri -a toc -a toclevels=4 -a num example2.txt
      File "/usr/local/bin/asciidoc", line 101
        except KeyError, k: raise AttributeError, k
                       ^
    SyntaxError: invalid syntax

Google the "`except KeyError`" line, and you get to a [Q&A on the AsciiDoc google group](https://groups.google.com/forum/#!topic/asciidoc/7ICtOReZJ74), which says "Asciidoc is Python 2, not 3."

### mclapply isn't working in windows

I got a report that parallel processing in my [R/qtl](http://www.rqtl.org) package wasn't working in Windows.

I googled "mclapply isn't working windows" (because mclapply was the function I was using) and got [this stackoverflow page](http://stackoverflow.com/questions/17196261/understanding-the-differences-between-mclapply-and-parlapply-in-r), which says:

<blockquote>since Windows does not have fork(), it will run standard lapply instead - no parallelization</blockquote>
