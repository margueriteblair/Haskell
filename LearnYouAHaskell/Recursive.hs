main :: IO ()
main = do
    print ("function bitch")


--This is about recursion baby!
--A resursive function has one or more base cases and one or more recusrive cases

--Recursive examples:

length' :: [a] -> Int
length' [] = 0
length' (_:xs) = 1 + length' xs

sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

product' :: (Ord a) => [a] -> a
product' [] = 1
product' (x:xs) = x * product' xs