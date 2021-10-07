import System.IO
import System.Random
--note the random package has to actually be installed with cabal install random!!!

main = do
    --openFile returns an IO file wrapped around a handle
    --We store this in the variable handle
    handle <- openFile "enable1.txt" ReadMode
    -- --hGesContents
    contents <- hGetContents handle
    gen <- getStdGen
    let words = map init (lines contents)
        (n, _) = randomR (0, (length words) - 1) gen :: (Int, StdGen) --We need a type specifiction
    play (words !! n)
    hClose handle
    -- putStrLn ("There are " ++ show (length (lines contents)) ++ " words")
    -- hClose handle
play word = do
    putStrLn word
    putStrLn "Enter a letter to guess: "
    line <- getLine
    putStrLn (handle (head line) word)
    play word

handle letter word
    | letter `elem` word = "Yup"
    | otherwise = "Nope"