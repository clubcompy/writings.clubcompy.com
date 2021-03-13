---
title: "What is ClubCompy?"
date: 2020-11-23T02:34:20-08:00
draft: true
tags: ["clubcompy","vision","vce","design","hype"]
---

At its conceptual core, ClubCompy is a monthly subscription service that
furnishes:
* **KidCompy VCE** &mdash; a retro-styled virtual computer that runs on desktop
  and mobile web browsers
* **ClubCompy Flier** &mdash; a mailed, hardcopy newsletter containing
  type-in games and utilities for the VCE
* **YouTube content** &mdash; a kid-friendly, Saturday morning software
  development show
* **Cloud storage** &mdash; for sharing VCE programs with friends and the world

We have a working prototype of the KidCompy VCE that is ready for production
use.  Here are some action shots:

{{< imageWithCaption src="/blog/images/colorwheel.png" caption="Image 1:  Turtle graphics" >}}
{{< imageWithCaption src="/blog/images/large_racecars_scene.png" caption="Image 2:  A lo-fi homage to Atari Super Sprint" >}}
{{< imageWithCaption src="/blog/images/spaceship.png" caption="Image 3:  Old school character graphics" >}}

After becoming a fully funded enterprise, the ClubCompy vision will encompass:
* **Expanded ClubCompy Flier** &mdash; a periodical magazine funded by print ad
  sales, media inserts
* **Expanded YouTube programming** &mdash; entertainment segments (licensed
  cartoons, webtoons and videogame-themed shows)
* **Software ecosystem** &mdash; online store where users can buy and sell
  VCE software
* **Custom, programmable, portable hardware** &mdash; pocket-sized peripheral
  that integrates with the VCE
* **Book publishing** &mdash; 1ˢᵗ party paper books that document VCE systems
  and support computer science learning, additional resources for classrooms
* **ClubCompy-branded merch** &mdash; clothing, toys, case badges, stickers,
  etc.

Here are some of the VCE features working presently:

* Glorious, retro-themed, 256 color, 40-column display with redefineable
  character graphics and parallax scrolling
* Keyboard, mouse and gamepad for input
* {{< row >}}
    {{% column class="col-md-9" %}}Turtle graphics{{% /column %}}
    {{< column class="col-md-3 align-self-center" >}}{{< floatedImage float="right" src="/blog/images/turtle_graphics.png" alt="Turtle drawing a sine wave" >}}{{< /column >}}
  {{< /row >}}
* Load and save programs to local storage on your computer or mobile device
* {{< row >}}
    {{% column class="col-md-9" %}}Easy to learn and use Comfy Programming Language{{% /column %}}
    {{< column class="col-md-3 align-self-center" >}}{{< floatedImage float="right" src="/blog/images/comfy_pennant.png" alt="Comfy pennant" >}}{{< /column >}}
  {{< /row >}}

Other features that we have partially implemented in the lab but not yet
generally available:

* 256 scalable sprites with pixel-perfect collision detection (works, but needs
  WASM optimizations)
* Old school FM sound for sound effects and music (works, but needs WASM
  optimizations)
* Cloud based storage for sharing programs with friends
