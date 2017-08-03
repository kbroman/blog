---
title: Code review
author: Karl Broman
date: '2013-09-25'
categories:
  - Programming
  - Statistics
tags:
  - papers
  - peer review
  - reproducible research
  - software
slug: code-review
---

There was an [interesting news item](http://www.nature.com/news/mozilla-plan-seeks-to-debug-scientific-code-1.13812) in Nature on [code review](http://en.wikipedia.org/wiki/Code_review).  It describes a project by some folks at Mozilla to review the code (well, really just 200-line snippets) from 6 selected papers in computational biology.

There are very brief quotes from [Titus Brown](http://ivory.idyll.org/blog/) and [Roger Peng](http://www.biostat.jhsph.edu/~rpeng/).  I expect that the author of the item, [Erika Check Hayden](http://www.nature.com/nature/about/editors/index.html#ErikaCheckHayden), spoke to Titus and Roger at length but could just include short bits from each, and so what they say probably doesn't fully (or much at all) characterize their view of the issue.

Titus is quoted as follows, in reference to another scientist who retracted five papers due to an error in his code:

<blockquote>"That's the kind of thing that should freak any scientist out.... We don't have good processes in place to detect that kind of thing in software."</blockquote>

Roger is quoted at the end, as follows:

<blockquote>"One worry I have is that, with reviews like this, scientists will be even more discouraged from publishing their code.... We need to get more code out there, not improve how it looks."</blockquote>

I agree with both of them, but my initial reaction, from the beginning of the piece, was closer to Roger's: We often have a heck of time getting any code out of people; if we are too hard on people regarding the quality of their code, they might become even less willing to share.

On the one hand, we want people to produce good code:

  * that works

  * that's readable

  * that's reusable

And it would be great if, for every bit of code, there was a second programmer who studied it, verified that it was doing the right thing, and offered suggestions for improvement.

But, on the other hand, it seems really unlikely that journals have the resources to do this. And I worry that a study showing that much scientific software is crap will make people even less willing to share.

I would like to see the code associated with scientific articles made readily available, during the review process and beyond. But I don't think we (as a scientific community) want to enforce rigorous code review prior to publication.

Later, on twitter, [Titus took issue](https://twitter.com/ctitusbrown/status/382862626692149248) with the "not improve how it looks" part of what Roger said:

<blockquote>".@kwbroman @simplystats @rdpeng Please read <http://en.wikipedia.org/wiki/Code_review> you are deeply, significantly, and completely wrong about code review."</blockquote>

Characterizing code review as strictly cosmetic was an unfortunate, gross simplification. (And how code looks _is_ important.)

I don't have enough time this morning to really clean up my thoughts on this issue, and I want to get this out and move on to reading that dissertation that I have to get through by tomorrow. So, let me summarize.

### Summary

We want scientific code to be _well written_: does what it's intended to do, readable, reusable.

We want scientific code to be _available_. (Otherwise we can't verify that it does what it's intended to do, or reuse it.)

If we're too hard on people for writing substandard code, we'll discourage the availability. It's an important trade-off.
