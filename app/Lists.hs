main :: IO ()
main = do
    print (1 : 2 : 3 : 4 : 5 : [])

--A list is a particular ordering of elements
--Every element has a fixed position
--Lists only have one internal type, we can't have mixed type lists

sum :: [Int] -> Int
sum [] = 0
sum (x:xs) = x + sum xs

evens :: [Int] -> [Int]
evens [] = []
evens (x:xs)
    | mod x 2 == 0 = x: evens xs
    | otherwise = evens xs