--Function definitions
--nameFunc arg1 arg2 ... argn = <expr>
--this expression is what the function returns
--There's no return statement in Haskell like in imperative programming
--This function checks if a given argument (the last one) is between the min and max value given
main :: IO ()
main = do
    print (in_range 0 5 3) --this will return true
    print (in_range 4 5 3) --this will return false

in_range :: Integer -> Integer -> Integer -> Bool
in_range min max x = x >= min && x <= max