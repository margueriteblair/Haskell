emptyBoard = ["...", "...", "..."]

--Returns the winner
winner :: [[Char]] -> Char
--Each letter represents a space on the board
--Each gaurd line checks for a winning combination
winner [[a,b,c], [d,e,f], [g,h,i]]
    | a == b && b == c && a /= '.'   = a
    | d == e && e == f && d /= '.'   = d
    | g == h && h == i && h /= '.'   = g
    | b == e && e == h && b /= '.'   = b
    | c == f && f == i && c /= '.'   = c
    | a == e && e == i && a /= '.'   = a
    | c == e && c == g && c /= '.'   = c
    | '.' `elem` [a,b,c,d,e,f,g,h,i] = '?' --Game not over
    | otherwise                      = '-' --Tie    

--Replaces the ith element of a list
replace :: Int -> a -> [a] -> [a]
replace 0 a (x:xs) = a:xs
replace i a (x:xs) = x:(replace (i-1) a xs)

--Replaces the character at position r, c in board
play :: Int -> Int -> Char -> [[Char]] -> [[Char]]
play r c a board = replace r (replace c a (board !! r)) board

--Returns the value of the board with the player to play
--Minamax tree search
--The recursive cases use list comprehensions
value :: Char -> [[Char]] -> Int
value player board
    | w == 'X'      = 1
    | w == '0'      = -1
    | w == '.'      = 0
    | player == 'X' = maximum [value '0' (play r c 'X' board) | r <- [0..2], c <- [0..2], board !! r !! c == '.']
    | otherwise = minimum [value 'X' (play r c '0' board) | r <- [0..2], c <- [0..2], board !! r !! c == '.']
    where w = winner board


--Returns, from a list of boards where X has just moved, the one with the max value
--This will actually let us know the best move
bestOf :: [[[Char]]] -> [[Char]]
bestOf [x] = x
bestOf (x:xs)
    | value '0' x > value '0' bxs = x
    | otherwise                    = bxs
    where bxs = bestOf xs

--Returns the board after X's best move
bestMove :: [[Char]] -> [[Char]]
bestMove board = bestOf [play r c 'X' board | r <- [0..2], c <- [0..2], board !! r !! c == '.']
