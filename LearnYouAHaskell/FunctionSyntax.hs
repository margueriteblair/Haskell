main :: IO ()
main = do
    print ("Hello")

-- For our first instrance of increasing function, our type signature
-- tells us that for any ordered type a, this function takes a list of a's and returns a bool.
increasing :: (Ord a) => [a] -> Bool
--The actual logic of the function is a deeply nested if else statement
-- We have to check first if our list is empty or if it's just one item bc then it's increasing
increasing xs = if xs == []
    then True
    else if tail xs == []
        then True
        else if head xs <= head (tail xs)
            then increasing (tail xs)
            else False

--the above function can be more easily written using pattern matching syntax
increasing2 :: (Ord a) => [a] -> Bool
increasing2 [] = True --Again, we say that this empty list is increasing
increasing2 [x] = True --As is a list of one item
increasing2 (x : y : ys) = x <= y && increasing (y:ys)