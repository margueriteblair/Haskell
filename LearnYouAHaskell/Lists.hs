--Each element in a linked list has a number and then a reference pointer that points to the next node
main :: IO ()
main = do
    let numbers = 5 : 4 : 3 : 2 : 1 : []
    print (length numbers)
    print (sum [1, 3..99]) --this is called a texas range
    print (['a' .. 'e'])

--Haskell data structures are immutable and never change
--max, min
--head, tail
--last, init
--sum 
--product
--elem

--list comprehensions
nums1 = [2^n | n <- [1..10]]
sodaSizes = [2^n | n <- [1..10], 2^n >= 10, 2^n < 100]
stringComp = [x | x <- "outrageous", not (elem x "aeiou")]
-- Infix method of the above: [x | x <- "outrageous", not (x `elem` "aeiou")]

--Tuples
--For lists, we can compare two lists of different lengths
--The size of a tuple is part of its type. We cannot compare tuples of different sizes.
--All elements of a list must be of the same type, all elements of a tuple can be different.


numbers2 = [1..8]
words = ["one", "two", "three", "four", "five", "six", "seven", "eight"]
pairs = zip numbers2 Main.words
[(fst p, fst q) | p <- pairs, q <- pairs, fst p < fst q, length (snd p) > length (snd q)]

--Chapter 2 problem set:
--Between 1 and 8, find all the pairs of numbers where the first num
--is less than the second, but the spelling if lexographically more

-- [(fst p, fst q) | p <- pairs, q <-pairs)] This one gets every possible combo
-- [(fst p, fst q) | p <- pairs, q <-pairs, fst p < fst q] This one gets all possible combos where the number is greater
-- zip numbers2 Main.words
--[(fst p, fst q) | p <- pairs, q <- pairs, fst p < fst q, length (snd p) > length (snd q)]
--[(3,4),(3,5),(3,6),(4,6),(5,6)] This is the result
