import System.IO


type Table k v = [(k, v)] --like key, value we want to associate keys & values
--We can achieve this with a type synonym for lists of pairs
--notes to test on other comp
--For this lookup table type, we'd like an interface of available functions so we can work with this type:
empty :: Table k v
insert :: k -> v -> Table k v -> Table k v 
delete :: Eq k => k -> Table k v -> Table k v
lookup :: Eq k => k -> Table k v -> Maybe v 