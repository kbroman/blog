---
title: Notifications from R
author: Karl Broman
date: '2014-09-03'
categories:
  - R
tags:
  - code
  - productivity
slug: notifications-from-r
---

You just sent a long [R](http://www.r-project.org) job running. How to know when it's done? Have it notify you by [beeping](https://github.com/rasmusab/beepr), [sending you a text](https://github.com/trinker/gmailR), or [sending you a notification](https://github.com/eddelbuettel/rpushbullet) [via pushbullet](http://pushbullet.com).

### [`beepr`](https://github.com/rasmusab/beepr)

You can use [Rasmus Baath](http://www.sumsar.net/)'s [beepr](https://github.com/rasmusab/beepr) package to have your computer play a sound.

Install it from [CRAN](http://cran.r-project.org) with

````
install.packages("beepr")
````

Then, at the bottom of your script, load the package and have it beep.

````
library(beepr)
beep()
````

[beepr](https://github.com/rasmusab/beepr) comes with a bunch of different sounds (e.g., try `beep("facebook")`), or use a path to any wav file. I tried [these cat sounds](http://www.kessels.com/CatSounds/), but they came out (with my computer's speaker) sounding more like a really unhappy electronic lion...not very pleasant.

[beepr](https://github.com/rasmusab/beepr) is cool, but most of my long-running jobs are on a distant server. It could be useful for local jobs on my Mac, but most of the time my computer is muted or the sound goes to my headphones (and my headphones are not always on my head). So I'm instead having my scripts send me a text or a notification via [pushbullet](http://pushbullet.com).

### [`gmailR`](https://github.com/trinker/gmailR)

There are a number of different packages for sending email from R (e.g., [sendmailR](http://cran.r-project.org/web/packages/sendmailR/index.html) and [mailR](http://cran.r-project.org/web/packages/mailR/index.html)). I tried [Tyler Rinker](http://trinkerrstuff.wordpress.com/)'s [gmailR](https://github.com/trinker/gmailR) package.

You can send yourself an email using the `gmail()` function. And since most cell phone companies have a method for sending a text via email, you can use this same function to send yourself a text. [gmailR](https://github.com/trinker/gmailR) includes a function `cell2email()` that will help you figure out the appropriate email address to use, to send a text to your phone.

The only problem with [gmailR](https://github.com/trinker/gmailR) is that you have to pass your gmail account and password to the `gmail()` function, and you don't really want to have that stuff sitting in your R script.

So I wrote a little package [mygmailR](https://github.com/kbroman/mygmailR), that will instead pull your private information from a file (`~/.gmail_private`). I set up a separate [gmail](https://mail.google.com) account for this purpose, and I set the security settings to use [app-specific passwords](https://support.google.com/accounts/answer/185833?hl=en).

My `~/.gmail_private` file looks like the following: app-specific gmail password, gmail account to be the default "from" email address (perhaps special for this purpose), the email address to use to send a text, and the default "to" email (which is my usual gmail account).

````
password my_private_app_specific_password
gmail    my_gmail_account@gmail.com
text     0123456789@txt.att.net
to       default_to@gmail.com
````

You need to install a few packages. [gmailR](https://github.com/trinker/gmailR) and [mygmailR](https://github.com/kbroman/mygmailR) are not available on [CRAN](http://cran.r-project.org), so you need to install [devtools](https://github.com/hadley/devtools) and use the `install_github()` function to install them from [GitHub](http://github.com).

````
install.packages(c("devtools", "rJython", "rJava", "rjson"))
library(devtools)
install_github("trinker/gmailR")
install_github("kbroman/mygmailR")
````

In your script, to send yourself a text, you'd write

````
library(mygmailR)
send_text("subject here" "body of message here")
````

To send yourself an email, write

````
library(mygmailR)
send_gmail("subject here", "body of message here")
````

### [`RPushbullet`](https://github.com/eddelbuettel/rpushbullet)

Another alternative (suggested to me by [Peter Hickey](https://twitter.com/PeteHaitch/status/507073412842278913) and [Jared Knowles](https://twitter.com/jknowles/status/507152898674143232)) is to use [Dirk Eddelbuettel](http://dirk.eddelbuettel.com/)'s [RPushbullet](https://github.com/eddelbuettel/rpushbullet) package to send yourself a notification via [pushbullet](http://pushbullet.com).

The main advantage of this, in my mind, is that there's no gmail password sitting around on your system anywhere, but rather just your [pushbullet](http://pushbullet.com) "Access Token", sitting in the file `~/.rpushbullet.json`, so this is less of a security issue.

  1. Sign up for [pushbullet](http://pushbullet.com); you'll need a [Google](http://www.google.com) account.

  2. Install the pushbullet app on your phone or other device, or install the chrome extension.

  3. Go to [your pushbullet account page](https://www.pushbullet.com/account) to get your "Access Token".

  4. Install the [RPushbullet](https://github.com/eddelbuettel/rpushbullet) package from CRAN.
  ```
  install.packages("RPushbullet")
  ```

  5. Create a `~/.rpushbullet.json` file with your api key and not much else.
  ```
  {
      "key": "your_api_key",
      "devices": [],
      "names": []
  }
  ```

  6. Install [jsonlite](http://cran.r-project.org/package=jsonlite) and use [RPushbullet](https://github.com/eddelbuettel/rpushbullet)'s `pbGetDevices()` function to get the identifiers for the devices you've registered with [pushbullet](http://pushbullet.com).
  ```
  install.packages("jsonlite")
  library(jsonlite)
  library(RPushbullet)
  fromJSON(pbGetDevices())$devices[,c("iden", "nickname")]
  ```

  7. Insert those device identifiers into your `~/.rpushbullet.json` file.
  ```
  {
      "key": "your_api_key",

      "devices": [
          "your_phone_device_id",
          "your_tablet_device_id",
          "your_chrome_device_id";
      ],

      "names": [
          "phone",
          "tablet",
          "Chrome";
      ]
  }
  ```

Now you're set!  Use the `pbPost()` function to post a message to yourself.
````
library(RPushbullet)
pbPost("note", "Title of note", "Body of message")
````

By default, the message is posted to the first device listed in your `~/.rpushbullet.json` file; to post it to a different device, use the argument `deviceind`, which takes a positive integer.

I'm still somewhat inclined towards using [gmailR](https://github.com/trinker/gmailR) and [mygmailR](https://github.com/kbroman/mygmailR) to send myself a text, but [RPushbullet](https://github.com/eddelbuettel/rpushbullet) seems more secure.

**Update**: The [word from Hadley](https://twitter.com/hadleywickham/status/507192305816567808): we should also check out [gmailr](https://github.com/jimhester/gmailr). [But you [can't currently send email](https://github.com/jimhester/gmailr/issues/5) with [gmailr](https://github.com/jimhester/gmailr).]
