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
let nums1 = [2^n | n <- [1..10]]
let sodaSizes = [2^n | n <- [1..10], 2^n >= 10, 2^n < 100]
let stringComp = [x | x <- "outrageous", not (elem x "aeiou")]
-- Infix method of the above: [x | x <- "outrageous", not (x `elem` "aeiou")]
