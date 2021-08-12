import System.IO

data Expr =
    Lit Int
    | Add Expr Expr
    | Neg Expr
    | IfZero Expr Expr Expr 

--Constructors
Lit :: Int -> Expr
Add :: Expr -> Expr -> Expr
Neg :: Expr
IfZero :: Expr -> Expr -> Expr -> Expr