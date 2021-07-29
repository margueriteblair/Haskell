import System.IO 
{-
In this lecture, we introduce the standard design pattern (catamorphism) which shapes the function
cata-means down
Bool is predefined, but not BUILT into Haskell

In Haskell, there are standard functions that aren't built into the language,
but instead are in a default module that's always loaded when you start GhCI or when you write a module by yourself
This module is called the prelude

-}

--We can also import booleans manually without the Prelude:
data Bool = True | False deriving Show

{-
Allowed patterns are:
Saturated constructor applications to other patterns.
Variables (match anything)
Underscore / wildcard pattern
Literals (numbers, chars, strings, list)
For non-overlapping definitions, the order does not matter
    - this means that if the cases are distinct, there's no overlapping qualitites, then the order doesn't matter
Best practice is to split cases into different constructors
-}
