--List exercises
--1. Create a function elem that returns True if an element is in
    --a given list and returns false otherwise
main :: IO()
main = do
    print (Main.elem 1 [])

elem :: (Eq a) => a -> [a] -> Bool
elem _ [] = False
elem n (x:xs)
    | n == x = True
    | otherwise = Main.elem n xs

elem2 :: (Eq a) => a -> [a] -> Bool
elem2 _ [] = False
elem2 e (x:xs) = (e == x) || (elem2 e xs)

--2. Create a function nub that removes all duplicates from a given list
--Done with two pattern matchings
nub :: (Eq a) => [a] -> [a]
nub [] = []
nub (x:xs)
    --Infix syntax for elem function
    | x `Main.elem` xs = nub xs
    | otherwise = x : nub xs

--3. Create a function isAsc that returns True if the list given to it is a list of ascending order
-- isAsc :: [Int] -> Bool
--4. 
--four
