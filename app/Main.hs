module Main where

import Lib

-- interactive shell command: ghci
-- you'll see prelude and know you're in

main :: IO ()
main = someFunc

-- will return one, this is a simple integer division function
--the above is the prefix manner
--below is the infix manner, sandwiched between two
5 `div` 5
succ 7 --will return 8
True
False
adaToUSD ada = ada * 0.08
