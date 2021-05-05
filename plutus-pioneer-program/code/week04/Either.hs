module Week04.Either where

import Text.Read (readMaybe)
-- import Week04.Monad

readEither :: Read a => String -> Either String a
readEither s = case readMaybe s of
    --can't parse is our error message and we append the string
    Nothing -> Left $ "can't parse: " ++ s
    Just a  -> Right a

--Left represents an error, right is the correct non-nothing response
--Right is like "Just", Left is like "Nothing"
--This foo function still has lots of repitition
foo :: String -> String -> String -> Either String Int
foo x y z = case readEither x of
    Left err -> Left err
    Right k  -> case readEither y of
        Left err -> Left err
        Right l  -> case readEither z of
            Left err -> Left err
            Right m  -> Right (k + l + m)

bindEither :: Either String a -> (a -> Either String b) -> Either String b
bindEither (Left err) _ = Left err
bindEither (Right x)  f = f x

--foo rewritten with readEither
foo' :: String -> String -> String -> Either String Int
foo' x y z = readEither x `bindEither` \k ->
             readEither y `bindEither` \l ->
             readEither z `bindEither` \m ->
             Right (k + l + m)

foo'' :: String -> String -> String -> Either String Int
foo'' x y z = threeInts (readEither x) (readEither y) (readEither z)
