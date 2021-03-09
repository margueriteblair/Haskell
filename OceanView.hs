main :: IO ()
main = do
    print (oceanFront [4,3,2,3,1] 0)


oceanFront :: [Int] -> Int -> [Int]
oceanFront xs e = 
    [ x | x <- xs, x > e]
--we have a variable big = 0
--if last x > big, then we allow x in the array and big is set to x
--Then we go again with the first elements of the array
