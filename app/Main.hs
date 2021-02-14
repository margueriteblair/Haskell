main :: IO ()
main = do
    print (in_range 0 5 3)

in_range :: Integer -> Integer -> Integer -> Bool
in_range min max x = x >= min && x <= max
-- in_range 0 5 3 

in_range2 :: Integer -> Integer -> Integer -> Bool
in_range2 min max x = if ilb then iub else False
    where 
        ilb = min <= x
        iub = max >= x

fac n =
    if n <= 1 then 1
    else n * fac (n - 1)