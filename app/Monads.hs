main :: IO ()
main = do
    print ("Hello, haskell")

--Monads are a mathematical concept that originated in the 1960's
--Gives you a new way of programming with effects

data Expr = Val Int | Div Expr Expr
