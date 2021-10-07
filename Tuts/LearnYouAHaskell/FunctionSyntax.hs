main :: IO ()
main = do
    print (watch3 7)

-- For our first instrance of increasing function, our type signature
-- tells us that for any ordered type a, this function takes a list of a's and returns a bool.
increasing :: (Ord a) => [a] -> Bool
--The actual logic of the function is a deeply nested if else statement
-- We have to check first if our list is empty or if it's just one item bc then it's increasing
increasing xs = if xs == []
    then True
    else if tail xs == []
        then True
        else if head xs <= head (tail xs)
            then increasing (tail xs)
            else False

--the above function can be more easily written using pattern matching syntax
increasing2 :: (Ord a) => [a] -> Bool
increasing2 [] = True --Again, we say that this empty list is increasing
increasing2 [x] = True --As is a list of one item
increasing2 (x : y : ys) = x <= y && increasing (y:ys)

increasing3 :: (Ord a)=> [a] -> Bool
increasing3 (x : y : ys) = x <= y && increasing (y:ys)
increasing3 _ = True

noVowels :: [Char] -> [Char]
noVowels word = if word == ""
    then ""
    else if head word `elem` "aeiouAEIOU"
        then noVowels (tail word)
        else (head word) : noVowels (tail word)


noVowels2 :: [Char] -> [Char]
noVowels2 "" = ""
noVowels2 (x:xs)
    | x `elem` "aeiouAEIOU" = noVowels2 xs
    | otherwise = x : noVowels2 xs

watch :: Int -> [Char]
watch n = if n == 7
    then "7 o'clock and ... SHARKNADO!"
    else show n ++ " o'clock and all's well."

watch2 :: Int -> [Char]
watch2 7 = "7 o'clock and ... sharknado!" --7 pattern needs to go first because Haskell will read these patterns in order!
watch2 n = show n ++ " o'clock and all's well."

watch3 :: Int -> [Char]
watch3 n = show n ++ "o 'clock and " ++ message n
        where message 7 = "... SHARKNADO!"
              message _ = "all's well."

watch4 :: Int -> [Char]
watch4 n = show n ++ " o'clock and " ++ case n of 7 -> "... SHARKNADO!"
                                        _ -> "all's well!"

gravity :: (Fractional a) => a -> a
gravity r = 6.674e-11 * 5.972e24 / (r^2)