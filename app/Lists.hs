main :: IO ()
main = do
    print (1 : 2 : 3 : 4 : 5 : [])

--generating a list:
asc :: Integer -> Integer -> [Integer]
asc n m
    m < n = []
    m == n = [m]
    m > n = n : asc (n+1) m

asc 1 3 --should return [1, 2, 3]