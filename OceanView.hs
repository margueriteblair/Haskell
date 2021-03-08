main :: IO ()
main = do
    print (oceanFront [4,3,2,3,1])

oceanFront :: [Int] -> [Int]
oceanFront xs =
    [x | x <- xs, x >= 3]