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
--We mostly work on chains recursively; be recursive where the data type is recursive
-- :: denotes, "of type"
--'not' Bool -> Bool

--Types, polymorphism, overloading:
--In the example of hasBlockProp, Haskell can see that there's two 'hasBlockProp' conditions/functions defined
--Haskell doesnt even need the method signature, it can infer what the types shouldbe


--Polymorphism:
data Chain =
    GenesisBlock
    | Block Chain Txs

--We can abstract from the type of transactions:
data Chain txs =
    GenesisBlock
    | Block (Chain txs) txs
--Then the type signatures change
GenesisBlock :: Chain txs
Block : Chain txs -> txs -> Chain txs

--How do you recognize type variables?
--Haskell has relatively strong conventions when it comes to whether identifiers start w/ upper or lower case
--normal identifiers are lower case, constructors are upper case
--Then on the type level, you have two different things, data types themselves, such as "Chain" or "Bool"
--anything that starts w alower case is a variable

--We cannot compare two functions in terms of equality
    --It's more about behavior
    --Functions don't support equality tests
--Equality comparitors get defined as a type class in Haskell:
    -- (==) :: Eq a => a -> a -> Bool

--Polymorphic chains are quite similar to built-in lists:
GenesisBlock :: Chain txs
Block :: Chain txs -> txs -> Chain txs
[] :: [a]
(:) :: a -> [a] -> [a]