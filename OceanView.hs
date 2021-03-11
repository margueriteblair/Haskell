main :: IO ()
main = do
    -- print (oceanFront [4,3,2,3,1] [])
    print (oceanFront [1, 3, 7, 3, 4])


oceanFront :: [Int] -> [Int]
oceanFront [] = []
oceanFront [x] = [x]
oceanFront (x:y:xs) = [1]

-- maximum :: [Int] -> Int
-- maximum [x] = x
-- maximum (x:xs)
--     | (Main.maximum xs) > x = Main.maximum xs
--     | otherwise = x
--we have a variable big = 0
--if last x > big, then we allow x in the array and big is set to x
--Then we go again with the first elements of the array
