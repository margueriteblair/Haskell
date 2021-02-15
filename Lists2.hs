--List exercises
--1. Create a function elem that returns True if an element is in
    --a given list and returns false otherwise

elem :: (Eq a) => a -> [a] -> Bool
elem _ [] = False
elem e (x:xs) = (e == x) || (elem e xs)