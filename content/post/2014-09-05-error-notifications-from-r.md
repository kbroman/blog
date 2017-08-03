---
title: Error notifications from R
author: Karl Broman
date: '2014-09-04'
categories:
  - R
tags:
  - code
  - productivity
slug: error-notifications-from-r
---

I'm enthusiastic about having [R notify me when my script is done](http://kbroman.org/blog/2014/09/03/notifications-from-r/).

But among my early uses of this, my script threw an error, and I never got a text or [pushbullet](http://pushbullet.com) about _that_. And really, I'm even more interested in being notified about such errors than anything else.

It's relatively easy to get notified of errors. At the top of your script, include code like `options(error = function() { } )`

Fill in the function with your notification code. If there's an error, the error message will be printed and then that function will be called. (And then the script will halt.)

You can use `geterrmessage()` to grab the error message to include in your notification.

For example, if you want to use [RPushbullet](https://github.com/eddelbuettel/rpushbullet) for the notification, you could put, at the top of your script, something like this:

````
options(error = function() {
                    library(RPushbullet)
                    pbPost("note", "Error", geterrmessage())
                })
````

Then if the script gives an error, you'll get a note with title "Error" and with the error message as the body of the note.

**Update**: I knew I'd heard about this sort of thing somewhere, but I couldn't remember where. Duh; [Rasmus](https://twitter.com/rabaath/) [mentioned it on twitter](https://twitter.com/rabaath/status/507087947041357825) just a couple of days ago! Fortunately, he reminded me of that in the comments below.

**Another update**: Ian Kyle pointed out in the comments that the above function, if used in a script run with `R CMD BATCH`, won't actually halt the script. The simplest solution is to add `stop(geterrmessage())`, like this:

````
options(error = function() {
                    library(RPushbullet)
                    pbPost("note", "Error", geterrmessage())
                    if(!interactive()) stop(geterrmessage())
                })
````
