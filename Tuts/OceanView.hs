main :: IO ()
main = do
    print (oceanView [4,3,2,3,1] 0)
    print (oceanView [1, 3, 7, 3, 4] 0)


oceanView :: [Int] -> Int -> [Int]
oceanView [] _ = []
oceanView (x:xs) y
  | x > y = length xs:oceanView xs x 
  | otherwise = oceanView xs y


-- maximum :: [Int] -> Int
-- maximum [x] = x
-- maximum (x:xs)
--     | (Main.maximum xs) > x = Main.maximum xs
--     | otherwise = x
--we have a variable big = 0
--if last x > big, then we allow x in the array and big is set to x
--Then we go again with the first elements of the array
