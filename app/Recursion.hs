--MARGIE::runhaskell MyFile.hs
--Wow, I am but a poor fool
--ghc MyFile.hs will compile the Haskell file and give you other Haskell output files as well
main :: IO ()
main = do
    print ("hello")

--recusion within functions
-- name <args> = ... name <args'> ...
-- passing a function and arguments into a function
-- loops and while loops do not exist in Haskell / FP

fac :: Integer -> Integer
fac n =
    if n <= 1 then
        1
    else
        n  * fac (n-1)