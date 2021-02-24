main :: IO ()
main = do
    print (map (\x -> x+1) [1,2,3,4,5])

--Higher order functions take in another function as an argument
--Higher order function, it's applied to x in its definition
app :: (a -> b) -> a -> b
app f x = f x 

--Anonymous functions
--We don't necessarily want to define functions with a name all the time
--add1 below can also be written without a named
add1 :: Int -> Int
add1 = (\x -> x+1)

--map function maps one list of this type a to another list of this type b
--The first argument is a function and converts one list to the other
--These list types can change!
-- map :: (a -> b) -> [a] -> [b]
-- map (\n -> x+1) [1,2,3,4,5] => [2,3,4,5,6]