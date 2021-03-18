import System.IO
import System.Random

main = do
    --openFile returns an IO file wrapped around a handle
    --We store this in the variable handle
    handle <- openFile "enable1.txt" ReadMode
    -- --hGesContents
    contents <- hGetContents handle
    gen <- getStdGen
    let words = map init (lines contents)
        (n, _) = randomR (0, (length words) - 1) gen :: (Int, StdGen)
    play (words !! n)
    hClose handle
    -- putStrLn ("There are " ++ show (length (lines contents)) ++ " words")
    -- hClose handle
