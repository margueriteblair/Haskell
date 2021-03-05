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