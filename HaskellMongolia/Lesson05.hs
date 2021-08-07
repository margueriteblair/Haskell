import System.IO

--Binary trees in Haskell

data Tree a = Leaf a | Node (Tree a) (Tree a)

Leaf :: a -> Tree a 
Node :: Tree a -> Tree a -> Tree a

