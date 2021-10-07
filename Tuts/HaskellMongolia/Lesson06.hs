import System.IO

data Expr =
    Lit Int
    | Add Expr Expr
    | Neg Expr
    | IfZero Expr Expr Expr 

--Constructors
--integer expressions

--literal integer
Lit :: Int -> Expr
--we want to sum or support addition, it's double recursive
Add :: Expr -> Expr -> Expr
--we want to represent the negation of the expression
Neg :: Expr -> Expr
IfZero :: Expr -> Expr -> Expr -> Expr

--evaluating an expression:
eval :: Expr -> Int
eval (Lit n) = n
eval (Add e1 e2) = eval e1 + eval e2
eval (Neg e) = - (eval e)
eval (IfZero e1 e2 e3) =
    if eval e1 == 0 then eval e2 else eval e3