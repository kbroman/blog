---
title: "debugging with docker and r-devel"
author: Karl
date: '2020-12-03'
slug: debugging-with-docker-and-r-devel
categories: [programming]
tags: [R, docker]
---

If you've not heard, there's a big [move away from Travis to GitHub
Actions](https://ropensci.org/technotes/2020/11/19/moving-away-travis/)
for continuous testing of R packages. I'm so glad for the
[infrastructure to
help](https://usethis.r-lib.org/reference/use_github_action.html), but
it's a bit of work to figure it out.

But that's not what I'm talking about today. Today I want to talk
about using [docker](https://www.docker.com/) to debug an R package
that is throwing an error in the development version of R. This came
up because with the new GitHub Actions infrastructure, I can now test
my R packages on multiple OSs and with multiple versions of R, and
today [R/qtl](https://rqtl.org) was shown to [throw an error in
R-devel](https://github.com/kbroman/qtl/runs/1495378157?check_suite_focus=true).

If you look at the [test history](https://github.com/kbroman/qtl/actions), you'll see I was mostly screwing
around trying to get LaTeX installed and then trying to get all of the
needed LaTeX packages for a 10-year-old Sweave-based vignette.
And I got through that only to find that there was a different actual
R problem that needed to be fixed.

Not wanting to install the development version of R on my machine, I
pondered cloud installations, and then thought, "Hmm, this seems like
a good application for docker. I just need to find a docker container
with R-devel, install R/qtl, and then try it out." And well, it was
pretty simple.

1. _Install Docker_. See the [official
   instructions](https://docs.docker.com/get-docker/).
   I'm working on a Ubuntu laptop, so I did:

   ```
   sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
   sudo apt update
   sudo apt install docker-ce docker-ce-cli containerd.io
   ```

2. _Create a `Dockerfile`_ which builds off [rocker/r-devel](https://hub.docker.com/r/rocker/r-devel/)
   and installs the package to be tested.

   ```
   FROM rocker/r-devel
   RUN R -e "install.packages('qtl')"
   ```

3. _Build the docker image_.

   ```
   sudo docker build -t rdevel-qtl .
   ```

4. _Fire up that image in a container_.

   ```
   sudo docker run -it rdevel-qtl bash
   ```

5. _Run R and load the package_.

    The above puts you into a bash shell within the container. Type
    `RD` to fire up the devel version of R, and then load your package
    and mess about. I quickly saw [where I went wrong](https://bit.ly/3qujHRV).

6. _Fix the problem and test it_.

    I _should_ add a formal test of this bug, and I _should also_ look
    for all other possible instances of this problem. (I blanche
    to think of them.)

    But for now I just plunged in and fixed it, pushed the change to
    GitHub, and then tested it out in my container by installing the
    repaired version with the [remotes](https://remotes.r-lib.org)
    package.

   ```
   install.packages("remotes")
   remotes::install_github("kbroman/qtl")
   ```

There's a lot more that one can do with Docker, but this was a pretty
quick and satisfying experience poking around in the development
version of R to fix a bug in my [ancient and
creaky](https://doi.org/10.5334/jors.at) package.
