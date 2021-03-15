main :: IO ()
main = do
    print (map (\x -> x + 1) [4, 5, 6, 7])

addAll :: (Num a) => [a] -> a
addAll [] = 0
addAll (x:xs) = x + addAll xs

multAll :: (Num a) => [a] -> a
multAll [] = 1
multAll (x:xs) = x * multAll xs

firstThat :: (a -> Bool) -> a -> [a] -> a
firstThat f = foldr (\x acc -> if f x then x else acc)

lastThat :: (a -> Bool) -> a -> [a] -> a
lastThat f = foldl (\acc x -> if f x then x else acc)

argmax :: (Ord b) => (a -> b) -> [a] -> a
argmax f[x] = x
argmax f (x:xs) = if f x > f (argmax f xs)
                  then x
                  else (argmax f xs)


