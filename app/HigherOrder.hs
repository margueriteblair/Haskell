main :: IO ()
main = do
    print ("hi, haskell")

--Higher order functions take in another function as an argument
--Higher order function, it's applied to x in its definition
app :: (a -> b) -> a -> b
app f x = f x 
