main :: IO ()
main = bar

bar :: IO ()
bar = getLine >>= \s ->
    getLine >>= \t ->
        putStrLn (s ++ " " ++ t)


data Maybe a = Nothing | Just a
--Defined in GHC.Maybe, sort of like the Optional operator in Java