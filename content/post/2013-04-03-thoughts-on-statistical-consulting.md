---
title: Thoughts on statistical consulting
author: Karl Broman
date: '2013-04-02'
categories:
  - Statistics
tags:
  - consulting
slug: thoughts-on-statistical-consulting
---

The [Statistics Department](https://www.stat.wisc.edu) at [UW-Madison](https://www.wisc.edu) has a course on statistical consulting, offered each semester. I'm often asked to give a lecture, which I do in an informal way: summarizing my experiences and answering questions.

I thought it might be useful write my thoughts on statistical consulting here: why, how, and difficulties.  This will be a bit rough, and long.  I'll revert to bullet points, to be more compact (and because I'm lazy).

<!-- more -->

### My situation

I'm an applied statistician at a university.  I have no defined consulting responsibilities.  Others at the university have a defined consulting role for a department or school, which pays part of their salary.  And then there are statisticians in industry (some effectively doing statistical consulting within a company), or working for a consulting company or as a contractor; I don't know much about these things, but only about my own situation: I feel I should do my best to help colleagues who ask for my advice (though I _can_ say no, at least in theory).

### Consulting vs. collaboration

To me, consulting is inherently short-term.  Someone comes to you for statistical advice, and you try to answer their questions within a week or two.  This is in contrast to collaboration, which is more long term, and gives you the opportunity to more fully understand the scientist's grander schemes.

### My experience

In graduate school (in [Statistics](https://www.stat.berkeley.edu) at UC-Berkeley), there was a statistical consulting course that involved pairs of graduate students holding weekly office hours, to give free statistical advice to anyone at the university (generally other graduate students), and then we met as a group weekly, with a faculty advisor, to discuss consultees' questions and get advice on what advice we might give.  I did the course three times, with [Andrew Gelman](https://www.stat.columbia.edu/~gelman/), [Terry Speed](https://www.wehi.edu.au/faculty_members/professor_terry_speed), and [David Freedman](https://www.stat.berkeley.edu/~freedman/), who, I think, span the space of applied statistics.  (Well, the good part of the space.)  Learning by doing (or, at least, by offering advice) was how I really became an applied statistician.  And seeing Andrew, Terry, and David's unique approaches was extremely influential.

After graduate school, I was a postdoc with a geneticist (Jim Weber, then at the Marshfield Medical Research Foundation, in Marshfield, Wisconsin), where I was relatively isolated, as a statistician.  There were a few other statisticians around, but we were working on rather different things.

Moving from postdoc to faculty member, I've had a relatively steady stream of statistical consulting experiences, with consultees from courses I taught, referred by my department chair or other friends/colleagues, or through my software (particularly [R/qtl](http://rqtl.org)) or publications (particularly my [two-part model](https://www.biostat.wisc.edu/~kbroman/publications/twopart.pdf) paper).

### Why do it?

I'm not paid to consult; there's no requirement that I do so.  So why do it?

  * Learn more biology, and from the experts.

  * See new data.  (I _love_ new data!)

  * Think about new problems.  (And it's nice to get an easy one every once in a while.  For example, it's nice to be able to say, "Yes, a t-test is appropriate here.")

  * Be useful: help people.

  * Publications.  (Deans may not read, but they do count. [I don't mean you, [Bob](https://www.med.wisc.edu/about/administration/robert-golden-md/38), but other Deans!])

  * Can lead to long-term collaboration, and allows you to find out if you like the person.

### How to behave at the initial meeting

  * Listen.

  * Verify that you're following (re-state according to your understanding).  ([Murray Clayton](https://www.stat.wisc.edu/~clayton/) recommended the book [How to talk so kids will listen and listen so kids will talk](https://www.amazon.com/exec/obidos/ASIN/1451663889/7210-20), and I do, too.)

  * Don't be embarrassed to admit ignorance.

  * Focus particularly on: the scientific questions, the form of the data, where the data came from.

  * Unless it's really simple, I'll usually delay giving specific advice to a second session.

A key difficulty: both parties must admit their ignorance, and need to be very patient.  At Berkeley, often a grad student was reporting on behalf of a faculty member, I think because the faculty member didn't want to admit his/her ignorance.

You generally need to force the scientist to back way up.  They're hoping for a quick answer (they often don't like this whole statistics business!), and so may not want to spend an hour explaining the full background.  But it can be critical.

Also, the scientist often mentions the use of some statistic that you've never heard of or that you know with a different name. For example: the G test (which is what [Sokal & Rohlf](https://www.amazon.com/exec/obidos/ASIN/0716786044/7210-20) call the likelihood ratio test for contingency tables), or the Hairbrainer-Warstein-Edmundsun Test (which I made up, but might actually exist).  When you admit that you don't know this statistical method that is so widely used in their field, they may question your credentials.  Ask for a reference; you'll be able to figure it out.

A very common experience: "I have a quick question..."  There are no quick questions.

### Difficulties that arise

  * Communication.

  * Admitting ignorance.

  * Getting the scientist to really explain things from the beginning

  * You don't have time to do the work, the consultee can't do it, and there's no one else to take over.

  * If you think you see a major problem, be careful about how you explain this.  (I'm not known for my subtlety, so I can't advise you on this.)

  * Co-authorship on publications (This seems to be more of a problem if you're being paid directly, in which case scientists, particularly MDs, seem to treat a statistical consultant like they do the person who repairs the PCR machine, or whatever.)

  * They don't want anything fancy, and you think it's needed.

An example instance requiring subtlety: As a graduate student, I was giving advice to an immunology graduate student whose experiment seemed to show a large sex effect, and since he hadn't blocked on sex, the whole thing seemed a wash.  I stated this point rather bluntly and never saw him again.

The relative importance of co-authorship vs acknowledgement (vs nothing) changes over one's career.  It's never really been an issue for me (though there is that one paper where they should have made me a coauthor but didn't, and then they acknowledged "Mark Broman" for statistical advice).  I feel a bit guilty being co-author on some papers, but it's definitely been valuable to me.  And it can be that a few hours' work on a manuscript can change it from unpublishable to easily publishable.

For me, generally: if I created some figures and/or wrote a portion of the methods section, I feel I should be co-author.

The following two sentences are remarkably different:

  * "Would you like to be a co-author?"

  * "We would like to include you as a co-author."

### How to say no

The hardest thing is to say no.  I haven't really figured this out.

  * Can you find someone to take over?

  * Try to give at least a rough guide (something is better than nothing).

  * I probably shouldn't state this publicly, but I try to apply a "two-week rule": If someone I don't know asks to meet with me, I'll say, "I'm really busy right now, but I could meet with you in two weeks."  Nothing productive occurs in the two weeks before a grant is due (which is the most common rush-rush type question).  The two-week rule seems to filter out much of the stuff that I don't really want to help with, anyway.

### Disadvantages to the whole thing

  * You generally don't have time to do things properly.

  * You don't know in advance what you're getting into.

  * You usually don't get to see long-term results.

  * I hate power/sample size calculations, and experimental design is really hard, and a high proportion of consulting questions involve sample size calculations or experimental design.

### Be self-sufficient

This doesn't exactly fit the topic under discussion, but I like to take this opportunity to emphasize the importance of applied statisticians being self-sufficient.

Most importantly, one should learn to program in perl (or python or ruby), for data manipulation.  Don't let the scientist do the data manipulation.  The answer to "How would you like to receive the data?" must always be "In it's current form!"

R programming is obviously important (for interactive analysis and graphics).  But I also emphasize the need for a lower-level language (I use C), for intensive computations.  The crappiest C program will almost always beat the most refined R program.  (Learn [Rcpp](https://github.com/hadley/devtools/wiki/Rcpp).)

### Time management

  * Don't let all of the small short-term things crowd out your long-term projects.

  * Save big blocks of time for yourself.

I've been reserving a full day each week to my own work, and I basically never agree to a meeting on that day.  (Don't tell anyone I said this!)

### Summary

Statistical consulting is a fabulous part of being an applied statistician.  I see lots of great new problems, I learn a lot of science (because I can ask questions of the experts), and I help people.

And I don't feel I need to know the answer to people's questions.  I view my role, as a statistical consultant, is to provide a connection, between the scientist with the question, and with some reasonable answer.  Once I understand the question, I'll ask all my friends: "Say, I got this really interesting question: What would you do?"  Eventually I'll find someone who can tell me what to say.
