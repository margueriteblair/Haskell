import System.IO

--Recalling from last time our contains function
containsBlock :: Int -> Chain -> Bool
containsBlock GensisBlock = False
containsBlock x (Block c t) =
    t == x || containsBlock x c
