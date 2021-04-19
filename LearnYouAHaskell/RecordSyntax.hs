import System.IO

data Person = Person String String String Int Float String String deriving (Show)

--This is kind of unreadable, and it's a pain to return single values of any part of the data

--We can achieve the same as the above with more readability
data Person2 = Person2 {
    firstName :: String,
    lastName :: String,
    age :: Int,
    height :: Float,
    phoneNumber :: String,
    flavor :: String
} deriving (Show)

data Car = Car String String Int deriving (Show)

data Car2 = Car2 {
    company :: String,
    model :: String,
    year :: Int
} deriving (Show)