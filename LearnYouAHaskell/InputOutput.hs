import System.IO

main = do
    handle <- openFile "enable1.txt" ReadMode
    contents <- hGetContents handle
    putStrLn ("There are " ++ show (length (lines contents)) ++ " words")
    hClose handle