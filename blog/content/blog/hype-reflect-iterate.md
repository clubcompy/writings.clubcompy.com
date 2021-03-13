---
title: "Hype, Reflect, Iterate ~ Cycles of Startup Success"
date: 2020-11-22T23:56:54-08:00
draft: true
type: "post"
tags: ["development","productivity-cycle","phase-hype","phase-feedback","phase-feature"]
---

I wonder if being a software developer makes one opposed to sales and marketing.
I certainly feel that way about myself; I really enjoy coding and that's about
it.

I have heard people chalk this phenomenon up to nerdiness and a lack of soft
skills.  But, I have been successful at consulting before and I did do some 
stage acting in high school and college and landed some good roles, too.  If I 
am honest, I have avoided the sales and marketing work for ClubCompy because it
was unfamiliar (scary) territory.  While it is not my preferred activity, with 
enough preparation I have the right stuff to at least put on a successful dog
and pony show to help sell [ClubCompy](https://clubcompy.com).

Even knowing all the work I need to do, the attraction of code is
powerful &mdash; there is so much delicious work left to do.  I know myself well
enough that blocking off hours on my calendar once in awhile for the "non-coding
tasks" will never yield results.  I have to force myself to close my IDE to do
the research, writing, planning and video production that ClubCompy deserves.
(And not be tempted to start the IDE back up until that work is finished!)  

{{< markdownCallout emoji="💰" file="/snippets/latestCallToAction.md" >}}

This calls for a product development cycle that _includes_ coding, but is not 
_dominated_ by it.  Our time must be divided into something like two-thirds 
business and one-thirds coding.  Out of necessity, I devised the **Hype, 
Reflect, Iterate** Productivity Cycles to give us the focus we need to startup
ClubCompy:

{{< imageWithCaption src="/blog/images/hype-reflect-iterate.svg" 
    caption="Diagram 1: The Hype-Reflect-Iterate productivity cycle" >}}

### Hype Phase

In the Hype Phase, our goal is to complete time-boxed tasks dedicated to
courting and keeping customers.  We will host events, create marketing content,
or tout the product's latest features.  We will rank order our planned tasks 
both by anticipated ROI and by estimated shortest-to-longest time-to-complete.

The impacts of each Hype Phase should be measurable, like new subscriber counts,
positive mentions in publications, or parleys.  

Our typical Hype phase goal will be to produce a YouTube video aimed
at kids and young adults who are interested in coding.  These videos will be
part ClubCompy tutorial and part entertainment.  As funding allows, our goal
would be to produce and release these videos on a regular cadence, up to once
per week.  We are thinking Saturday morning should become our time slot.

After we grow large, we would like to experiment with our time slot, adding more
content to draw in lots more viewers.  As a kid in the 80's, Saturday morning
cartoons were an event I looked forward to every week.  Can we recreate that
anticipation and those good times?  

The internet affords us a lot of freedom.  We could draw lots of kids and 
nostalgic parents with licensed/recycled entertainment (cartoons, kid variety 
shows) as well as new content we commission (web comics, videogame let's plays, 
etc.)

{{< sidebar title="Ephemeral Content ⇒ Important Content" 
    file="/snippets/ephemeralContentImportantContent.md" >}}

### Reflect Phase

The Reflect Phase wraps up the previous cycle and contains the planning needed
to kickoff the next cycle.  The goal throughout this phase is to connect with 
users, collect feedback, document what worked and what didn't, and use that 
intelligence to plan the features and content theme for the next cycle.  In the 
Reflect Phase we will:

* analyze how our Hype activities were received by the community, 
* connect directly with the community via Twitch live stream to socialize and
get direct feedback from users, 
* do planning based on our learnings for the next cycle with the central goal
of finding a product market fit for ClubCompy, and
* write a blog post or parley that summarizes the previous cycle and announces
what will be done in the next cycle

{{< sidebar title="Community building with Discord" 
    file="/snippets/communityBuildingWithDiscord.md" >}}

### Iterate Phase

In the Iterate Phase, we'll hide with social media turned down, and implement
the next planned feature(s).

Part of the time we spend in the Iterate phase must include releasing new 
features into the production environment.  This will include updates to our
documentation website.

### Reality Check

_Hype, Reflect, Iterate_ is depicted above idealistically.  Reality is messier.

#### Hobby Project Teething Pains

As much as we tout our coding standards and our ability to produce bug-free
code, the ClubCompy codebase is transitioning from hobby/passion project mode.
It is a hodge podge of modern, fully-tested components and crufty, ten year old 
javascript hacks heavily reliant on JQuery.  We are methodically making our 
way through the codebase, rewriting components and bringing them under test.  
But, the presence of so much legacy code surely means there are lots of bugs.

The only way forward is to make bug remediation our top priority as we startup.
We will drop everything and address these bugs as users bring them to our 
attention.  After all, the _KidCompy Virtual Computing Environment™_ (VCE) will
be accessed by newbie children on desktop and mobile computer hardware, much of
which will be underpowered.  It is mission-critical that our user 
experience be as trouble-free and optimized as possible or else we will
instantly lose the newbies who will lack the patience and skill to work around
our problems.  

So many hidden issues can derail the VCE that we cannot anticipate, and we
must constantly be on guard against new performance or stability bugs.  No bug
is too small.  If you spot one, please help us improve the experience
by reporting the bug in the 
[github issue tracker](https://github.com/clubcompy/writings.clubcompy.com/issues).
Please prefix your issue titles with "VCE:" to let us know the bug you are
seeing is in the compy and not a documentation issue.  We will make your bugs 
an urgent priority, especially if we think we can fix them in a short amount
of time.

Allowing ourselves to be derailed at any time to fix bugs is bound
to mess up our commitments to make hype videos, finish features, or
do Twitch live coding.  It's just how things have to be until we can bring the
codebase fully under control.

#### Not Enough Time for Coding?

Each of our productivity cycles will run for four weeks.  At 40 hours a week,
the Iterate Phase will get only 53 hours a month.  Developers might cringe at
this; how will anything get done?

We have three thoughts on this.  First, not all coding should happen in the 
Iterate Phase.  For example, the custom programming language we have developed
for the KidCompy VCE is called Comfy.  Part of our challenge in hyping 
ClubCompy will be to write fun games and utilities in the Comfy Language that 
we can show off in Hype videos and print.  We will avoid any Comfy coding 
during the Iterate Phase, and instead, we will steal time from the other phases
to do any Comfy coding needed for Hype videos or print.  Most of the live 
coding we do on Twitch will likely be casual Comfy scripting, with creative 
direction provided by our users.

Second, anyone who develops code professionally knows the productivity boost of
getting into a "flow" state.  Mixing Comfy coding tasks with Java and JavaScript
coding tasks has proven to be challenging.  The amount of mental gear shifting
required to switch between programming paradigms can be very disruptive.
Therefore, delineating the Iterate Phase for the _particular type_ of coding 
needed for the website and KidCompy VCE systems will help a lot with flow.  We 
can maximize the 53 hours we get for the Iterate Phase by focusing entirely on 
the business systems within ClubCompy.

Third, we believe that by successfully connecting with our users in the Reflect
Phase, just prior to each Iterate Phase, we will gain superior design insights.
These insights will reduce the amount of time we waste on dead end code
experiments and get us to '**done**' quicker. 

#### Let the Market Speak  

ClubCompy is transitioning from a Hobby/Passion project to a full-blown 
Internet Startup with paid content creators and technical staff.  That
transformation will be complete once you and a few thousand of your friends 
become [Patreon](https://patreon.com) subscribers.  😉

Until that happy day arrives, we will be operating on hobby time &mdash; 
building toward our incremental goals and delivering value as job, family and 
health allows.  Therefore, each cycle may extend over many months until we get
traction and the whole enterprise is funded.    

### TL;DR

Drilling down one level of detail, the task breakdown of our **Hype, Reflect, 
Iterate** productivity cycle seems straightforward and effective:

{{< imageWithCaption src="/blog/images/hype-reflect-iterate-lvl2.svg" 
    caption="Diagram 2: The Hype-Reflect-Iterate productivity cycle drill down" 
>}}
  
The time management that **Hype, Reflect, Iterate** imposes will enable us to
complete all the myriad other tasks beyond code that our business needs to 
startup. 

{{< signature salutation="Cheers" >}}

{{< markdownCallout emoji="💰" file="/snippets/latestCallToAction.md" >}}
