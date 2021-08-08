import System.IO

--Binary trees in Haskell

data Tree a = Leaf a | Node (Tree a) (Tree a)

Leaf :: a -> Tree a 
Node :: Tree a -> Tree a -> Tree a

flatten :: Tree a -> [a]
flatten (Leaf a) = [a]
flatten (Node l r) = flatten l ++ flatten r

--computing the height of a tree
--leaves have a height of 0
height :: Tree a -> Int
height (Leaf x) = 0
height (Node l r) = 1 + max (height l) (height r) --we take the max and add 1