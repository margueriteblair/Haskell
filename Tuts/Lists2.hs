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
--This one uses three pattern matchings
isAsc :: [Int] -> Bool
isAsc [] = True
isAsc [x] = True
isAsc (x:y:xs) =
    (x <= y) && isAsc(y:xs)
--4. We have a list if int tuples, they represent nodes that are connected to one another
--Create a function hasPath that determines if a path from one node to another
    --exists within a directed graph
    --recursion, algorithms
hasPath :: [(Int, Int)] -> Int -> Int -> Bool
hasPath [] x y = x == y
hasPath xs x y
    | x == y = True
    | otherwise =
        let xs' = [(n,m) | (n,m) <- xs, n /= x] in
       or [hasPath xs' m y | (n, m) <- xs, n==x]     
