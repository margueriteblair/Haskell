emptyBoard = ["...", "...", "..."]

--Returns the winner
winner :: [[Char]] -> Char
winner [[a,b,c], [d,e,f], [g,h,i]]
    | a == b && b == c && a /= "."   = a
    | d == e && e == f && d /= "."   = d
    | g == h && h == i && h /= "."   = g
    | b == e && e == h && b /= "."   = b
    | c == f && f == i && c /= "."   = c
    | a == e && e == i && a /= "."   = a
    | c == e && c == g && c /= "."   = c
    | '.' `elem` [a,b,c,d,e,f,g,h,i] = '?' --Game not over
    | otherwise                      = '-' --Tie    

--Replaces the ith element of a list
replace :: Int -> a -> [a] -> [a]
replace 0 a (x:xs) = a:xs
replace i a (x:xs) = x:(replace:(i-1) a xs)

--Replaces the character at position r, c in board
play :: Int -> Int -> Char -> [[Char]] -> [[Char]]
play r c a board = replace r (replace c a (board !! r)) board

--Returns the value of the board with the player to play
value :: Char -> [[Char]] -> [[Char]]
value player board
    | w == 'X' = 1
    | w == '0' = -1
    | w == '.' = 0
    | player == 'X'