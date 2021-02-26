main :: IO ()
main = do
    print ("Hello, haskell")

--Monads are a mathematical concept that originated in the 1960's
--Gives you a new way of programming with effects


--We've got two constructors here in our data type, we've got Val and Div
--Val builds expressions from integers
--Div builds expressions from two sub expressions
--Here we're building a new datatype called Expr 
--It's got two new constructors, Val & Div
data Expr = Val Int | Div Expr Expr

--Maths vs Haskell
eval :: Expr -> Int
eval (Val n) = n
eval (Div x y) = eval x `div` eval y --this is problematic though, because y could result to 0 and then we'd have a runtime error

--NB: `div` function performs integer division
--The (/) function requires arguments whose type is in the class Fractional and performs standard division
--The div function requires arguments whose type is in the class Integral and performs Integer division

