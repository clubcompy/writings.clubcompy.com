Letting errors bubble up to a top-level exception handler by default is called
"fail-fast".  The opposite pattern, "fail-safe", says to handle all errors where
they happen and let the code continue on after recovery.

I find "fail-safe" to be awfully challenging even though it seems like a logical
choice.  In complex programs, I often don't know what to do with an error, and
my handling only logs the problem to continue on and possibly fail worse later
(aka 'swallowing' errors.)

My past hubristic attempts at "fail-safe" inevitably made my code brittle and
difficult to maintain.  **"fail-fast" strongly recommended!**
