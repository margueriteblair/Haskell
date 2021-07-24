import System.IO

--Recalling from last time our contains function
containsBlock :: Int -> Chain -> Bool
containsBlock GensisBlock = False
containsBlock x (Block c t) =
    t == x || containsBlock x c

--Remember, Txs is just a type synonym for Integer,
-- That being said, we can make a function that'll determine whether this Tx/Int meets a given criteria
--We need the parenthesis to show that it's one argument in conjunction
hasBlockProp :: (Txs -> Bool) -> Chain -> Bool
hasBlockProp prop GensisBlock = False
hasBlockProp prop (Block chain tx) =
    prop t || hasBlockProp prop c