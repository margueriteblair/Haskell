main :: IO ()
main = do
    print (oceanFront [4,3,2,3,1])


oceanFront :: [Int] -> [Int]
oceanFront [] = []
oceanFront [x] = [x]

--we have a variable big = 0
--if last x > big, then we allow x in the array and big is set to x
--Then we go again with the first elements of the array
