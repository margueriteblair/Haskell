main :: IO ()
main = putStrLn "Hello World"

bar :: IO ()
bar = getLine >>= \s ->
    getLine >>= \t ->
        putStrLn (s ++ " " ++ t)