main :: IO ()
main = do
    print (oceanFront [4,3,2,3,1])

oceanFront :: [Int] -> [Int]
oceanFront xs =
    let big = 3
    [x | x <- xs, x >= big]