main :: IO ()
main = do
    print ("Hello test")


--Haskell is lazy, has type inference, and is purely functional
--Functions in Haskell never consult memory or have side effects
--When we say that Haskell is lazy, we mean that Haskell will wait until
--it's absolutely necessary to evaluate functions
--Haskell has type inference, meaning things are statically typed, but we don't have to declare the type
