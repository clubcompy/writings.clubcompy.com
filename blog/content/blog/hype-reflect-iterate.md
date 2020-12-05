---
title: "Hype, Reflect, Iterate ~ Cycles of Startup Success"
date: 2020-11-22T23:56:54-08:00
draft: true
type: "post"
tags: ["development","productivity-cycle","phase-hype","phase-feedback","phase-feature"]
---

I wonder if being a software developer makes one opposed to sales and marketing.
I certainly feel that way about myself; I really enjoy coding and that's about
it.  It's probably because my creativity gravitates to the problem solving space 
with more clever strategy and less artistic flourish.

I did do some stage acting in high school and college and landed some good 
roles, too.  So while it is not my preferred activity, with enough preparation 
I have the right stuff to put on a dog and pony show in order to sell 
[ClubCompy](https://clubcompy.com).

Still, the attraction of code is very powerful - especially since there is so 
much delicious work left to do.  I know myself well enough that simply blocking
off hours on my calendar once in awhile for "non-coding tasks" will not yield
results.  I must force myself to close my IDE for extended periods of time to 
do the research, writing, planning and video production that ClubCompy requires.
(And not be tempted to start the IDE back up until that work is finished!)  

{{< markdownCallout emoji="💰" file="/snippets/latestCallToAction.md" >}}

I needed a product development cycle that _includes_ coding (ere I die), but is
not _dominated_ by it.  My time will need to be divided into something like 
two-thirds business and one-thirds coding.  So, out of necessity, I devised 
the **Hype, Reflect, Iterate** Productivity Cycles to give this developer the
focus needed to startup ClubCompy:

{{< imageWithCaption src="/blog/images/hype-reflect-iterate.svg" caption="Diagram 1: The Hype-Reflect-Iterate Cycle" >}}

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

Once we grow large, we would like to experiment with our timeslot, adding more
content to draw in lots more viewers.  As a kid in the 80's, Saturday morning
cartoons were an event I looked forward to every week.  Can we recreate those
good times?  The internet affords us a lot of freedom.  We could draw lots of
kids and nostalgic parents with licensed/recycled entertainment (cartoons, 
kid variety shows) as well as new content we commission (web comics, videogame
let's plays, etc.)

#### Philosopher's Corner: Ephemeral Content ⇒ Important Content

One complaint we have about YouTube is that its searchable long tail of content
stretches all the way back to its founding.  This mind-boggling capability of YT
to recall all content ever published drives the value of a creator's new
content creations down to almost nothing.  One's new content must compete with
endless past works that range in quality from priceless to trash.

The long tail and just plain abundance of channels on YouTube is a distraction
inviting mindless content binging.  The long tail particularly disserves kid 
audiences who have not yet developed the skill of picking up cues for what
makes content worth their time like production values or story.

Services like Twitch are designed to be more "in the moment" with past video 
clips automatically falling off the end of a channel's clip browser into the
void after a set time.  This is a feature we would like to emulate on ClubCompy.
When we can achieve a regular cadence to our video production, it would
probably make sense to make our videos fall off the YouTube channel seasonally.

YouTube is tough to beat as a content delivery service, and we would like to
use it to distribute our shows.  One thought we have to partly divorce
ourselves from the long tail is to implement our own show browser on
[clubcompy.com](https://clubcompy.com) and embed the YT player on each of our
videos' pages there.

We can configure the player to our needs by embedding the YT player on our own 
website rather than directing our customers to YouTube's website.  For 
example, we can configure the embedded player to restrict suggested videos 
shown after our videos end to only our channel's videos.  This should help to 
lessen the general distraction-factor of YouTube.  And, hosting our own browse 
function will facilitate switching to another video service if YouTube ever 
decides to censor us for any reason.

### Reflect Phase

Reflect Phase may consist of the following:

* analyze how our Hype activities were received by the community, 
* connect directly with the community via Twitch live stream to socialize and
get direct feedback from users, 
* do planning based on our learnings for the next cycle with the goal of finding
a market fit for ClubCompy, and
* write a blog post or parley that summarizes the previous cycle and announces
what we will do in the next cycle

We have also considered running a Discord server to better connect with our 
patreons.  We have seen examples of vibrant Discord communities whose content 
creators are in constant, meaningful contact with their people.  Such Discord 
communities succeed by having committed moderator volunteers/employees to manage
the channels and speak on behalf of the community when unproductive discussions
need to be quashed.  We do not yet have anyone that could fill that role.  Also,
Discord is no place for kids, so we would need to figure out how to rig an 
invite-only thing where we could restrict access to only our adult subscriber 
users.  While Discord is intriguing to us, we will have to wait on it until 
there is a clear need.

### Iterate Phase

In the Iterate Phase, we'll hide with social media turned down, and implement
the next planned feature(s).

Part of the time we spend in the iteration phase must include releasing new 
features into the production environment.  This will include updates to our
documentation website 

### Reality Check

_Hype, Reflect, Iterate_ is depicted above idealistically.  Reality is messier.

#### Hobby Project Teething Pains

First, as much as we tout our coding standards and ability to produce bug-free
code, the ClubCompy codebase is transitioning out of hobby/passion project mode.
It is a hodge podge of modern, fully-tested components and crufty, ten year old 
javascript hacks heavily dependent on JQuery.  We are methodically making our 
way through the codebase, rewriting components and bringing them under test.  
But, the presence of so much legacy code means there are lots of bugs.

The only way forward is to make bug remediation our top priority as we startup.
We will drop everything and address these bugs as users bring them to our 
attention.  After all, the _KidCompy Virtual Computing Environment™_ (VCE) will
be accessed by newbie children on desktop and mobile computer hardware, much of
which is going to be underpowered.  It is mission-critical that our user 
experience be as trouble-free as possible or else we will instantly lose the 
newbies who will lack the patience and skill to work around the problems.  

So many things can potentially derail the VCE that we cannot anticipate, and we
must constantly be on guard against new performance or stability bugs.  No bug
is too small.  If you spot one, please help us improve the experience
by reporting the bug in the 
[github issue tracker](https://github.com/clubcompy/writings.clubcompy.com/issues).
Please prefix your issue titles with "VCE:" to let us know the bug you are
seeing is in the compy and not a documentation issue.  We will make your bugs 
an urgent priority, especially if we think we can fix them in a short amount
of time.

Of course, allowing ourselves to be derailed at any time to fix bugs is bound
to throw off commitments we make to deliver hype videos, finish features, or
do Twitch live coding.  It's just how things have to be until we can bring the
system under our full control.

#### Not Enough Time for Coding?

Each of our productivity cycles will run for four weeks.  At 40 hours a week,
the Iterate Phase will get only 53 hours a month.  Developers might cringe at
this; how will anything get done?

We have two thoughts on this.  First, not all coding will happen in the Iterate
Phase.  For example, the custom programming language we have developed for 
ClubCompy is called Comfy.  And, part of our challenge in hyping ClubCompy will
be to write fun games and utilities in Comfy that we can show off in videos and
print.  We will avoid any Comfy coding during the Iterate Phase, and instead, 
we will steal time from the other phases as appropriate to do any Comfy coding
that needs to be done.

Anyone who develops code for a living knows the productivity value of getting
into a "flow" state.  We find it very difficult to mix Comfy coding tasks with
the Java and JavaScript coding tasks we have to develop the website.  The amount
of mental gear switching required to shift between programming paradigms can be
very disruptive.  Therefore, delineating the Iterate Phase for the _particular
type_ of coding for the website and the KidCompy VCE systems will really help
with flow.  We can maximize the 53 hours for Iterate Phase by focusing entirely
on the business parts of our ClubCompy systems.   

Second, we believe that by successfully connecting with our users in the Reflect
Phase, just prior to each Iterate Phase, we will gain superior design insights.
These insights will reduce the amount of time we waste on dead end code
experiments and get us to '**done**' quicker. 

#### Let the Market Speak  

ClubCompy is _transitioning_ from a Hobby/Passion project to a full-blown 
Internet Startup with paid content creators and technical staff.  The only way 
we can complete that transition is with you and a couple thousand of your
friends becoming regular [Patreon](https://patreon.com) subscribers.

Until that happy day arrives, we will be operating on hobby time &mdash; 
building toward our incremental goals and delivering value when job, family and 
health allows.  Therefore, each cycle may extend over many months until we get
traction.    

_TODO: Show same diagram as above with reality mixed in (some comfy work in 
the tail end of the Reflect phase, bug triage duty for the entire cycle, etc.)_    

{{< signature salutation="Cheers" >}}

{{< markdownCallout emoji="💰" file="/snippets/latestCallToAction.md" >}}
