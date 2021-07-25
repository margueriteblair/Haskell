import System.IO

--Recalling from last time our contains function
containsBlock :: Int -> Chain -> Bool
containsBlock GensisBlock = False
containsBlock x (Block c t) =
    t == x || containsBlock x c

--Remember, Txs is just a type synonym for Integer,
-- That being said, we can make a function that'll determine whether this Tx/Int meets a given criteria
--We need the parenthesis to show that it's one argument in conjunction
--If we didn't use the parenthesis, then it'd be a curried function w/ 3 args
hasBlockProp :: (Txs -> Bool) -> Chain -> Bool
hasBlockProp prop GensisBlock = False
hasBlockProp prop (Block chain tx) =
    prop t || hasBlockProp prop c

--use a lambda expression to define a function on the fly
--This would be how it would look in GhCI
hasBlockProp' :: (\x -> x > 10) chain2 False
-- 'even' is a predefined haskell function

hasBlockProp'' :: (Txs -> Bool) -> Chain -> Bool
hasBlockProp'' = \ prop chain ->
    case chain of
        GensisBlock -> False
        Block c t   -> prop t || hasBlockProp'' prop c

--Now we have chainLength, hasBlock, and hasBlockProp