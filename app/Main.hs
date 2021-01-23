module Main where

import Lib

-- interactive shell command: ghci
-- you'll see prelude and know you're in

main :: IO ()
main = someFunc

div 5 5 -- will return one, this is a simple integer division function
--the above is the prefix manner
--below is the infix manner, sandwiched between two
5 `div` 5
succ 7 --will return 8
True
False
adaToUSD ada = ada * 0.08
usdToADA usd = usd / (8 / 100) -- the '/' function required arguments whose type is in the class fractional
--div function requires integers
myFavoriteBCProject = "Cardano" --no args, but will always return cardano

acronymBuster acronym = if acronym == "PoS" then "Proof of Stake"  else "I have never seen that before"
--basics of conditional statements

--a string is just a list of chars as evidenced by
-- he :t "hi" :: [Char]
--['i', 'o'] ++ ['h', 'k'] string concatenation
-- 1 : [2, 3, 1, 4] this will add 1 to the front of the list
--'P' : 'l' : 'u' : 't' : 'u' : 's' : [] adds to a list backwards to produce the string 'Plutus'
--there's no loop in haskell/functional programmng
--the different parts of the lists have different names
--the head is the first node
--last is the last
--init is everything that's not last-
--tail is everything that's not first
--other list functions: sum, product, length
--2 `elem` [1,2,3,4,5] will return true b/c 2 is in the haskell list

--using haskell ranges, we can populate a larger list
--for instance, [1..100] can create an ordered list 1-100 on its own
--ranges can takea second arg, a step, where they incremet by the step
--[20,19..5]

--concepts of infinite lists: [1..] it never stops
--take vs a finite range
--haskell is lazy
--take 30  $ cycle [1,3,4] will still  cycle the elements infinitely
--but it'll stop once the list has 30 items
--take has to args 1: items to take 2: list
--replicate is an easier version of repeat
--replicate 6 7 replicate x y do y x times
--set comprehensions: a way of defining a list of unique things/numbers
--x is a natural number, 1 - inf, x is also less than 10
--that second argument restricts everything to less than 10
--once you've got those rules in place, you then multiply by 2
--list comprehension!
--not equal to /=
--[x | x <- [10..20], x == 13 || x == 15 || x == 19]

