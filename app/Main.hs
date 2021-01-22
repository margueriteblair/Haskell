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
