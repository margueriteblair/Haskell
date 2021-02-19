main :: IO ()
main = do
    print (in_range 0 5 3)

in_range :: Integer -> Integer -> Integer -> Bool
in_range min max x = x >= min && x <= max
-- in_range 0 5 3 

in_range2 :: Integer -> Integer -> Integer -> Bool
in_range2 min max x = if ilb then iub else False
    where 
        ilb = min <= x
        iub = max >= x

fac n =
    if n <= 1 then 1
    else n * fac (n - 1)

is_zero 0 = True
is_zero _ = False
--the underscore _ is a wildcard character

--Other notes:
--In functional programming, we're interested in pure functions
--When we say pure functions, we mean that the functions we create in Haskell
--Have an input, some arguments, an output and nothing else
--All of our datatype are immutable, once they are created, they cannot be changed
--No/Less side effects in FP
--Declarative
--Easier to verify

