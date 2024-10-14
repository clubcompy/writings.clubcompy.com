---
title: "Async/Await is Not Mere Syntactic Sugar"
date: 2024-03-15T19:56:55-07:00
draft: false
author: Woldie
tags: ["async","await","Promise","errors","JavaScript","Typescript"]
onhomepage: true
---

{{< sidebar file="../snippets/sales-message.md" >}}

## Intro

The `async`/`await` keywords reshaped how I work in JavaScript (and Typescript.)
I have always admired how `async`/`await` took less typing to produce working
code versus the Promise API equivalent production.  But, the less experienced
programmer me thought of `async`/`await` as mere syntactic sugar.  I imagined
maybe Promises were somehow the "pure" and "more efficient" option when it came
to async programming.

I learned through experience that `async`/`await`:

 * offers a distinct programming paradigm relative to Promises that made my
   asynchronous code quality better, and yet
 * did not eliminate my use of Promise's `.catch()` API.  I needed to mix n'
   match `async`/`await` with `.catch()` in my code in an unexpected, powerful
   way.

## A Promise I Can Keep

The Promises API was a powerful upgrade over old school JavaScript async
programming which consisted of DOM events and registered callbacks.  I think the
first time I saw a Promise API was in JQuery.  I recall it wasn't fully
compliant with the [Promises-A](https://promisesaplus.com/) spec that emerged
later, so I didn't get much opportunity to use it before moving on.

After JQuery, I enjoyed slick 3rd party Promise implementations like
[Bluebird](http://bluebirdjs.com/docs/api-reference.html) and
[Q](https://github.com/kriskowal/q).  And once a native Promise API started
shipping in browsers, I learned to be proficient with the bog standard
browser implementations even if they lacked frills.

A Promise is an object that wraps a future value, or Error.  At any time,
we can call a Promise's `.then()` function and give it a callback.  Once a
future value is set into the Promise, at the next opportunity, the
JavaScript engine will call the `.then()` callback with the value as a parameter.

{{< markdownCallout emoji="🤔" file="../snippets/promise-instances-are-regular-objects.md" >}}

Another neat feature of `.then()` is that it is a fluent API.  Meaning, we can
chain multiple `.then()` calls in a single statement to build fancy,
multi-step asynchronous processes.

Each `.then()` call returns a new Promise that will be fulfilled with whatever
`.then()`'s callback returns.  If the callback returns a plain
value, `.then()` will return a Promise that is immediately resolved with that
value.  If the callback returns another Promise, `.then()` will return a Promise
that resolves to whatever the returned Promise resolves to.  A Promise callback
that returns nothing makes its Promise's type something akin to `Promise<void>`
or `Promise<undefined>`, which is legal and ok to do if that's what's desired.

To handle errors thrown in a Promise callback, attach
a `.catch()` call with callback to receive the thrown Error for handling.
Whenever a Promise callback throws an Error, the JavaScript engine will set the
Promise chain to rejected status and then skip to the first  `.catch()` callback
that follows in the chain.  For processing, the `.catch()` callback has the
option to:

* re-/throw an Error to propagate the rejected status further down the chain, or
* return an object to change the Promise status to resolved.  In this way, the
  `.catch()` error handler can recover from failure

It is bad, probably a bug, when a Promise chain terminates in the rejected state.
The JavaScript engine may log an warning in the console, but otherwise
the uncaught error will "drop on the floor" and go unprocessed.  For proper
error handling, it is best-practice to have a `.catch()` at the end of _every_
Promise chain.

## It's Not a Threat. It's a Promise.

How about an example?

Here I perform a three-part asynchronous operation.  First, I make an AJAX call
with the
[`fetch()`](https://developer.mozilla.org/en-US/docs/Web/API/fetch) API, which
returns a `Promise<Response>` for a portrait image.  Then, I extract the image
payload as a `Promise<Blob>` with
[`Response#blob()`](https://developer.mozilla.org/en-US/docs/Web/API/Response/blob).
Finally, I set the URL of the Blob as the background image of a DIV:

```javascript
function toPortraitUrl(name) {
  // synchronous code goes here to translate name to a URL
}

/**
 * @param {string} name portait name
 * @returns {Promise<Response>} the fetch API returns a Promise
 */
function loadPortraitImage(name) {
  const url = toPortraitUrl(name);
  return fetch(url);
}

/**
 * @param {string} enemyId
 */
function setEnemyPortrait(enemyId) {
  loadPortraitImage(enemyId)
    .then((response) => response.blob())
    .then((blob) => {
      const blobUrl = URL.createObjectURL(blob);
      const portraitDiv = document.getElementById('portrait');
      portraitDiv.style.backgroundImage = `url(${blobUrl})`;
    });
}

setEnemyPortrait('penguin');
```

This is very suspect example code.  As is, `setEnemyPortrait()` will leak memory
in the sneakiest way every time it's called.  Such hijinks are very
common IRL, le sigh.

## Handling Errors Like a Boss

If this code were my job, the memory leak would be a low priority backlog item
since it's probably a slow leak.  However, professionalism demands that error
conditions must be handled immediately with grace and aplomb.  Proper error
handling is "table stakes", and the code above has no error handling.

When I am coding synchronous, non-Promises code, if I do not plan on crafting
some magical error recovery routine or fallback in a module where errors occur,
I **_omit_** try-catch blocks in that module.  Not catching allows errors to
bubble up to a top-level error handler.

That top-level error handler can display a dialog to the user or scream curses
into the server log.  The error handler typically communicates to whomever
should care: "Something important to you broke.  Here's some details you should
know about.  Please try again later".

Generic top-level error handlers won't win any awards for content or UX, but
they do unfailingly inform users when something failed (which is better than the
alternative, trust me, professionalism!)  Also, concentrating error handling to
a catch-all spot in the code makes 'sad path' programming easier to reason about.

{{< markdownCallout emoji="🎓" file="../snippets/fail-fast-vs-fail-safe.md" >}}

## Error Prone and Awkward

Unfortunately, error handling with Promises often bedevils us.  Promises are a
bummer for handling errors because we have to attach a dedicated `.catch()`
callback to each Promise chain.  That by itself threatens to ruin my fail-fast
designs because the error handler seems stuck living with the Promise chains in
the middle of my code.

In the following example, I use `.catch()` to handle my errors.  In addition
to fail-fast becoming over-complicated, it is easy to lose sight of what lines
of code the Promise chain's `.catch()` covers for thrown exceptions:

```javascript
function toPortraitUrl(name) {
  // synchronous code goes here to translate name to a URL
}

function loadPortraitImage(name) {
  const url = toPortraitUrl(name);                              // WON'T CATCH
  return fetch(url);                                            // will catch
}

function setEnemyPortrait(enemyId) {
  loadPortraitImage(enemyId)
    .then((response) => response.blob())                       // will catch
    .then((blob) => {
      const blobUrl = URL.createObjectURL(blob);               // will catch
      const portraitDiv = document.getElementById('portrait'); // will catch
      portraitDiv.style.backgroundImage = `url(${blobUrl})`;   // will catch
    })
    .catch((e) => {
      console.error('Enemy portrait failed', e);
    });
}

setEnemyPortrait('penguin');
```

`loadPortraitImage()` returns a Promise, and it contains a mix of
synchronous and asynchronous code.  The synchronous code can error out
before the first Promise in the chain is created.  So, some errors will
bubble up past `setEnemyPortrait()` while the remainder will
be caught by the `.catch()` callback.  That might not be what was intended, and
it would be nice if `.catch()` could catch all the errors.

Well, I can unify that error handling of synchronous and asynchronous code
by adding a ugly bit of Promise wrapperizing inside `loadPortraitImage()`:

```javascript
function toPortraitUrl(name) {
  // synchronous code goes here to translate name to a URL
}

function loadPortraitImage(name) {
  return new Promise((resolve) => resolve(toPortraitUrl(name))) // wrapped call
    .then((url) => fetch(url));
}

function setEnemyPortrait(enemyId) {
  loadPortraitImage(enemyId)
    .then((response) => {
        /* ... */
    })
    .then((blob) => {
      /* ... */
    })
    .catch((e) => {
      console.error('Enemy portrait error', e); // toPortraitUrl errors caught!
    });
}

setEnemyPortrait('penguin');
```

**Brief explanation:**  synchronous code like `toPortraitUrl()` can be wrapped in a
`new Promise`'s callback.  That callback may instantly `resolve()` the Promise
to its value.  Any error that gets thrown in a `new Promise`'s callback _will_
propagate through the Promise as a rejection, and a subsequent `.catch()`
attached to the Promise chain will intercept that error.

## Syntax: the #1 Doctor Recommended Pain Medicine

Hm, that was both confusing _and_ fiddly!  Thankfully, we can achieve the same
or better effect with simpler `async`/`await`-style code:

```javascript
function toPortraitUrl(name) {
  // synchronous code goes here to translate name to a URL
}

async function loadPortraitImage(name) {
  const url = toPortraitUrl(name);

  return await fetch(url);
}

async function setEnemyPortrait(enemyId) {
  const response = await loadPortraitImage(enemyId)

  const blobUrl = URL.createObjectURL(response.blob());
  const portraitDiv = document.getElementById('portrait');
  portraitDiv.style.backgroundImage = `url(${blobUrl})`;
}

try {
  await setEnemyPortrait('penguin');
} catch (e) {
  alert(`Unexpected error: ${e.message}`);
}
```

In the example above, all errors thrown by any line of code, whether
originating in a Promise or not, will bubble up to and be caught by the single
`try`-`catch` wrapping `setEnemyPortrait()`.  It's practically fool-proof!

`async`/`await` helps to abstract the use of Promises by eliminating a lot
of boilerplate and callback closures.  It is super interesting to observe how
transpilers like Babel implement `async`/`await` for older JavaScript engines.
As an abstraction, I can tell you that `async`/`await` is doing some heavy
lifting -- but that is another blog post.

More important to the examples above, `async`/`await` lets us seamlessly
integrate synchronous and asynchronous code bodies; it all looks like plain
JavaScript code.  Even more important, it provides a unified error handling
scheme that simplifies the code.

## The Grand Façade

Even in my tiny enemy portrait example, Promises by themselves require more
work and caution to use than the equivalent `async`/`await` productions.  This
advantage scales up with the viral effect of `async`/`await` syntax because its
effects can seamlessly span 1st and 3rd party module boundaries due to it being
a language construct rather than just an API.

I loved everything about this and set out to convert all of ClubCompy's
Promises-based code over to `async`/`await` syntax!  Here are the conversion
rules I followed:

1. if a function returns a Promise, it must be marked `async`
2. if a function contains any `await`'d calls, it must be marked `async`
3. if a Promise is returned from a function call,
    * mark the call with `await`

My rules meant that any time `async` was employed somewhere deep in the code,
all the callers above that layer would end up getting `async`/`await`-ified.

I first observed this viral propagation only after a lot of work and I
felt disgusted:  what would `async`-ifying practically everything do to
performance?  I mistakenly saw `async`/`await` as forcing Promises into
working as synchronous code.  To what purpose?

Practically my whole program became littered with `async`/`await`.  I bled
performance and muddied up my codebase with those keywords everywhere just for a
bit of gain in the error-handling department?  Worse than useless!  Intolerable!

It seemed foolish to migrate away from Promises to `async`/`await` in my
ClubCompy codebase, so I shelved that effort.  Much sadness!

## It _Does_ Blend!

JetBrains IntelliJ provided insights later on that led me to embrace
`async`/`await` everywhere in my code without any downsides.

IntelliJ shows inspection warnings like the following whenever
I forget to prefix an `await` on a call to an `async` function:

{{< imageWithCaption
      src="/images/missing_await.png"
      alt="Screenshot of IntelliJ inspection help text showing an async JavaScript function signature where the synthesized return type is highlighted that reads 'Promise<any | undefined>'"
      caption="IntelliJ's inspection callout for my missing await" >}}

I noticed the curious `Promise<any | undefined>` return type on the synthesized
function signature.  `async` functions _always_ appeared to return a Promise
(even if there was a `void` return value.)

So, could I treat any `async` function's return value as a standalone Promise
chain?  The answer is yes.  I should have known it was 'yes', but the
`async`/`await` syntax mystified me, and I couldn't see how plainly it all
operated.

I came to understand those IntelliJ inspection messages translate to valid
warnings:  "Hey Bub, that function call returned a Promise, and you did nothing
with it!"  To satisfy IntelliJ, I had to either `await` the returned Promise or
chain it to `.then()` and/or `.catch()`.

With that insight, my rule #3 changed:

3. if a Promise is returned from a function call,
    * mark the call with `await`, **or**
    * chain the call to `.catch()`

Why only `.catch()` and not a `.then()` followed by a `.catch()`?

`.then()` is the processing equivalent of `await` on happy paths, so technically
they are never needed in my scheme.  I prefer to enjoy the fancier, easier
syntax of `async`/`await` wherever I can get it.

I only needed to revert to the Promises API for the `.catch()` error handler at
the top-level of my asynchronous call stacks.  Correctness by fail-fast
standards AND I quieted IntelliJ's Promise inspection warnings!

## Async Eye for the Promises Guy

Suddenly `async`/`await` became a joy to employ for the vast majority of my code
and its use wasn't so viral after all.

Wherever I had asynchronous code, I could refactor and modularize it using the 3
rules.  Inside the modules were a mix of asynchronous and synchronous code bodies
that were easy to combine using `async`/`await` syntax.  Often great swaths of
code in these modules could be simple, easily tested synchronous classes with
perhaps only a simple controller at the top needing the `async`/`await` treatment.

And, it was interesting to discover that my top-level `.catch()` error handlers
on these modules had differing needs.  Some needed to enqueue error messages that
should be surfaced elsewhere to the user in the near-future.  Some needed to
implement retry logics before giving up and/or offer cancellation logics.  And a
few represented completely optional, best-effort, asynchronous fluff, where
failures were okay and at-best resulted in warning log messages.

That last fluff case was a surprise because these Promises were never synchronizing
with the rest of the code.  Chaining my Promises to `.catch()` meant I could
implement "fire and forget"-style or "fiber"-style lightweight threading in my
JavaScript code.  This shouldn't have been a surprise, but in my mind it was a
paradigm shift.

## JavaScript Jazz Hands

In my coding career, I have not encountered a programming language and ecosystem
combo quite as productive as JavaScript given ES2017+ (the version where
`async`/`await` was introduced), modern DOM API's & CSS with all browsers
behaving mostly the same, the vast NPM library, and NodeJS-based tooling on
Linux or Mac for packaging and transpiling.

I can layer in and enjoy Typescript in my day job, but I find TS only pays off for
the team once our production code and build system grows to employ a large number
of synergistic, strongly-typed libraries. That lets Typescript's type system have an
opportunity to work some actual magic at runtime.  But, by that point, the build and
unit test runtimes have probably become terribly slow compared to equivalent JavaScript
code.

In projects I own, like ClubCompy, I prefer JavaScript. With JS, I can let JetBrains
give me the illusion of strongish typing and IntelliSense.  It feels something
like the Typescript coding experience, all without any of the processing
overhead -- but that is another blog post.

Modern, vanilla JavaScript has been very productive for me.  It is so easy to
mix programming paradigms like functional and OO, fold in high-performance bits
like WASM, and do Test-Driven Development with hot-reloading of code into
test-runner, server and browser.  JetBrains does a heroic amount with my code
at design-time given JS' dynamism.  Everything across the ecosystem seems
simultaneously straightforward and tricked out.  If only NPM wasn't such a tire
fire -- but that is another blog post.

## In Conclusion, Your Honor ...

On both server and browser, I have much asynchronous code to manage.  That
was awkward until `async`/`await` rolled along.  I never would have been
able to build in a FAT file system into ClubCompy for file storage without it --
but that is also another blog post.

**TL;DR**: I strongly recommend `async`/`await` and encourage you, dear reader, to
adopt my 3 rules of asynchronous JavaScript modules:

1. if a function returns a Promise, it must be marked `async`
2. if a function contains any `await`'d calls, it must be marked `async`
3. if a Promise is returned from a function call,
    * mark the call with `await`, **or**
    * chain the call to `.catch()`

## Meme, or it didn't happen
Here's today's silly, baseless meme to tease the `.then()` hangers-on into submission! 😈

{{< imageWithCaption
src="/images/then_is_a_code_smell.jpg"
alt="Skeletor opines, '.then() is a code smell' and then runs away shouting, 'Until we meet again!'"
caption=".then() is a code smell" >}}

## Addendum

Here are other built-in Promise API tools I appreciate and find useful with
`async`/`await` but did not discuss above:
* [`Promise.all()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/all)
* [`Promise.any()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/any)
* [`Promise.race()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/race)
* [`Promise.reject()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/reject)
* [`Promise.resolve()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/resolve)

## Comments

{{< discussOnHackerNews >}}
