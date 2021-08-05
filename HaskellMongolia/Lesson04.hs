import System.IO


type Table k v = [(k, v)] --like key, value we want to associate keys & values
--We can achieve this with a type synonym for lists of pairs
--notes to test on other comp