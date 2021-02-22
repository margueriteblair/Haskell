main :: IO ()
main = do
    print (Main.sum [1, 2, 3])

--A list is a particular ordering of elements
--Every element has a fixed position
--Lists only have one internal type, we can't have mixed type lists

sum :: [Int] -> Int
sum [] = 0
sum (x:xs) = x + Main.sum xs

evens :: [Int] -> [Int]
evens [] = []
evens (x:xs)
    | mod x 2 == 0 = x: evens xs
    | otherwise = evens xs

--Tuples

--Simple tuple function that would return the first element of a two element tuple
fst :: (a, b) -> a
fst (x, _) = x

snd :: (a, b) -> b
snd (_, y) = y
