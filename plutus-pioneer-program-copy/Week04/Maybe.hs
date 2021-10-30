module Week04.Maybe where

import Text.Read (readMaybe)
import Week04.Monad

foo :: String -> String -> String -> Maybe Int
--if all strings can be successfully parsed as ints, then you return the sum
--if one of the parses fails, then you return nothing
foo x y z = case readMaybe x of
    Nothing -> Nothing
    Just k  -> case readMaybe y of
        Nothing -> Nothing
        Just l  -> case readMaybe z of
            Nothing -> Nothing
            Just m  -> Just (k + l + m)

--bind maybe function to make the code above in the "foo" function more resuable
--this function takes a Maybe a which goes to another function (a -> Maybe a)
bindMaybe :: Maybe a -> (a -> Maybe b) -> Maybe b
bindMaybe Nothing  _ = Nothing
bindMaybe (Just x) f = f x

--now we use the bind maybe as a helper function to write foo'
--This simplifies the foo function so we don't have messy logic
foo' :: String -> String -> String -> Maybe Int
foo' x y z = readMaybe x `bindMaybe` \k ->
             readMaybe y `bindMaybe` \l ->
             readMaybe z `bindMaybe` \m ->
             Just (k + l + m)
-- foo' :: String -> String -> String -> Maybe Int
-- foo' x y z = readMaybe x `bindMaybe`


foo'' :: String -> String -> String -> Maybe Int
foo'' x y z = threeInts (readMaybe x) (readMaybe y) (readMaybe z)
