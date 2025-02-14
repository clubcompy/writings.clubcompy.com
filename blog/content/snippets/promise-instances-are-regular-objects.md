Most Promises I have encountered in code are `.then()`'d once and then
not used again.  But, I want to demystify Promises so that we might find
more uses for them.  I like to think of Promises like a cached value.

When viewing a Promise like a cache, the `.then()` API gives us access to its
cached value.  While the Promise's value is not yet fulfilled, the `.then()` API
makes the caller(s) wait to be called back.  If the Promise's value is already
fulfilled, the `.then()` API will call the callback with the value as soon as
possible. Promise objects can be:

Additional demystification:  even though `Promise` is a built-in browser class,
`Promise` instances are not treated as special in any way by the language.

`Promise` instances are:

* regular objects and can be assigned to variables,
* passed around as parameters in our programs,
* kept long-term for reuse (used as an object cache),
* `.then()`'d multiple times over time, as well as `.then()`'d multiple times
  simultaneously by different asynchronous actors
* garbage collected when they go out of scope like any other
  JavaScript object would, even when the `Promise` does not become fulfilled.
  (In other words, there's no super-secret internal reference to your Promise
  that you do not control that can keep it from garbage collecting.)
