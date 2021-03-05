main :: IO ()
main = do
    print ("Hello")

increasing :: (Ord a) => [a] -> Bool
increasing xs = if xs == []
    then True
    else if tail xs == []
        then True
        else if head xs <= head (tail xs)
            then increasing (tail xs)
            else False

--the above function can be more easily written using pattern matching syntax
increasing :: (Ord a) => [a] -> Bool
increasing [] = True
increasing [x] = True
increasing (x : y : ys) = x <= && increasing (y:ys)