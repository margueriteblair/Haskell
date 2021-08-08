import System.IO

--Binary trees in Haskell

data Tree a = Leaf a | Node (Tree a) (Tree a)

Leaf :: a -> Tree a 
Node :: Tree a -> Tree a -> Tree a

flatten :: Tree a -> [a]
flatten (Leaf a) = [a]
flatten (Node l r) = flatten l ++ flatten r