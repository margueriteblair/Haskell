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
