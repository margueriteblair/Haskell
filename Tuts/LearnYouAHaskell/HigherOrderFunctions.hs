main :: IO ()
main = do
    print (map add1 [1, 2, 3, 4])
    print ()

add1 :: Int -> Int
add1 x = x + 1

f :: (Int -> Int) -> Int
f x = 3

            --returns a function here
g :: Int -> (Int -> Int)
g x = add1

add1ToEach :: [Int] -> [Int]
add1ToEach [] = []
add1ToEach (x:xs) = add1 x : add1ToEach xs

--h takes an int that returns a function that in turn returns an int
h :: Int -> (Int -> Int)
h x y = x + y

-- Languages are said to be able to pass in functions
-- add1ToEach :: [Int] -> [Int]
--map is a popular higher order function
--map takes in two arguments: a list and a function
--it'll return the list that has has the output effect on it of the function passed in

