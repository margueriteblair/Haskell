--Function definitions
--nameFunc arg1 arg2 ... argn = <expr>
--this expression is what the function returns
--There's no return statement in Haskell like in imperative programming
--This function checks if a given argument (the last one) is between the min and max value given
main :: IO ()
main = do
    print (in_range 0 5 3) --this will return true
    print (in_range 4 5 3) --this will return false


--The way this is set up, you won't be able to pass anything other than an Integer to in_range function
in_range :: Integer -> Integer -> Integer -> Bool
in_range min max x = x >= min && x <= max

--Types basics
--We use the two colon structure 
x :: Integer
x = 1

y :: Bool
y = True

z :: Float
z = 3.14159

--The below is IMPROPER HASKELL SYNTAX, BUT we want to find a way to store variables that are created within the functional logic
in_range2 min max x =
    in_lower_bound = min <= x;
    in_upper_bound = max >= x;
    return (in_lower_bound && in_upper_bound)