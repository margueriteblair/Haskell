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
    - if they're really non-overlapping, then it really doesn't matter how you permute them
Best practice is to split cases into different constructors
-}

not :: Main.Bool -> Main.Bool
not Main.False = Main.True
not Main.True = Main.False

(||) :: Bool -> Bool -> Bool
False || c = c
True || _ = True

--guards vs ifthenelse

--Maybe is for optional values
data Maybe a = Nothing | Just a 
--Maybe int, maybe string
--First arg in constructor is nothing, second is a
--Like in Java, this would be if something were to potentially return null

--Maybe has two constructors, nothing and just
Nothing :: Maybe a
Just :: a -> Maybe a 

ifthenelse :: Bool -> a -> a -> a
ifthenelse False _t e = e
ifthenelse True t _e = t

fromMaybe :: a -> Maybe a -> a
fromMaybe def Nothing = def
fromMaybe _ (Just a) = a --a is a convention, ones a type, one's a var

-- `backticks` to use a function infix

data (a, b) = (a, b) --pair syntax

swap :: (a, b) -> (b, a)
swap (a, b) = (b, a)

--function of arg, then returns func that'll take the second argument
--look at currying
curry :: ((a, b) -> c) -> a -> b -> c
curry f a b = f (a, b)

--lists, are important in functional programming
--haskell has a lot of special syntax
--notes on lists
data [a] = [] | a : [a] --first case is an empty list, second is one w a tail

--elem:
elem :: Eq a => a -> [a] -> Bool
elem x [] = False
elem x (y : ys) = x == y || elem x ys


