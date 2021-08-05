import System.IO


type Table k v = [(k, v)] --like key, value we want to associate keys & values
--We can achieve this with a type synonym for lists of pairs
--notes to test on other comp
--For this lookup table type, we'd like an interface of available functions so we can work with this type:
empty :: Table k v --a method to construct an empty table
empty = []
insert :: k -> v -> Table k v -> Table k v --method where we take a key, a value, an existing table, returns a new table
insert k v t = (k, v) : t --just prepend the k and v to the existng table, pairs occuring earlier will shadow the existing one
delete :: Eq k => k -> v -> Table k v -> Table k v --We will need an equality constaint
delete _ _ [] = [] --deleting from an empty list pattern matcing
delete k v ((k', v') : kvs )
    | k == k' = delete k kvs 
    | otherwise = (k', v') : delete k kvs
-- lookup :: Eq k => k -> Table k v -> Maybe v  --lookup where we need equality to compare. if the key is not found in the table then we return nothing
--as we can see here, we don't modify existing tables, we create new ones