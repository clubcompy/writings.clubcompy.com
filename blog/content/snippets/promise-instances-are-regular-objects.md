Most Promises I have encountered in code are `.then()`'d once and then
discarded.

But, I find it helpful to demystify what a Promise is in order that I might find
more uses for it.  I consider a Promise to operate like a single value cache.
We can access a Promise's cached value more than once by calling its `.then()`
API repeatedly and whenever needed.

More demystification:  even though `Promise` is a built-in browser class,
`Promise` instances are not treated as special in any way by the language.
`Promise` instances can be:

* assigned to variables,
* passed around as parameters in our programs,
* kept long-term for reuse, and
* can be garbage collected when they go out of scope like any other
  JavaScript objects would even when the `Promise` instance is not fulfilled.
  IOW, there's no super-secret internal reference to your Promise that you are
  not privy to.
