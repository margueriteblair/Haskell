emptyBoard = ["...", "...", "..."]

--Returns the winner
winner :: [[Char]] -> Char
winner [[a,b,c], [d,e,f], [g,h,i]]
    | a == b && b == c && a /= '. = a