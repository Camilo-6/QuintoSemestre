module MiniHs.Inter where
-- definir interprete normal, sin ambientes

import MiniHs.Expr

data Value = NumV Int
        | BooleaNoV Bool
        | NilV
        | ConsV Value Value
        | LamV String Type Expr
        deriving (Eq, Show)

toValue :: Expr -> Value
toValue (Num n) = NumV n
toValue (BoolE b) = BooleaNoV b
toValue Nil = NilV
toValue (Cons e1 e2) = ConsV (toValue e1) (toValue e2)
toValue (Lam x t e) = LamV x t e
toValue e = error text where text = "no es valor " ++ show e

toExpr :: Value -> Expr
toExpr (NumV n) = Num n
toExpr (BooleaNoV b) = BoolE b
toExpr NilV = Nil
toExpr (ConsV e1 e2) = Cons (toExpr e1) (toExpr e2)
toExpr (LamV x t e) = Lam x t e

inter :: Expr -> Value 
inter e = toValue (inter2 e)

inter2 :: Expr -> Expr 
inter2 e = if e == e2 then e else inter2 e2 where e2 = step e

step :: Expr -> Expr
step (Var x) = Var x
step (Num n) = Num n
step (BoolE b) = BoolE b
step Nil = Nil
step (Cons Nil e1) = e1
step (Cons e1 e2) = if isValue e1 then Cons e1 e4 else Cons e3 e2 where e3 = step e1; e4 = step e2
step (Head (Cons e1 e2)) = e1
step (Head Nil) = Nil
step (Head e1) = Head e2 where e2 = step e1
step (Tail (Cons e1 e2)) = e2
step (Tail Nil) = Nil
step (Tail e1) = Tail e2 where e2 = step e1
step (Plus (Num n1) (Num n2)) = Num (n1 + n2)
step (Plus (Num n1) e2) = Plus (Num n1) e3 where e3 = step e2
step (Plus e1 e2) = Plus e3 e2 where e3 = step e1
step (Minus (Num n1) (Num n2)) = Num (n1 - n2)
step (Minus (Num n1) e2) = Minus (Num n1) e3 where e3 = step e2
step (Minus e1 e2) = Minus e3 e2 where e3 = step e1
step (Times (Num n1) (Num n2)) = Num (n1 * n2)
step (Times (Num n1) e2) = Times (Num n1) e3 where e3 = step e2
step (Times e1 e2) = Times e3 e2 where e3 = step e1
step (Div (Num n1) (Num n2)) = Num (div n1 n2)
step (Div (Num n1) e2) = Div (Num n1) e3 where e3 = step e2
step (Div e1 e2) = Div e3 e2 where e3 = step e1
step (Mod (Num n1) (Num n2)) = Num (mod n1 n2)
step (Mod (Num n1) e2) = Mod (Num n1) e3 where e3 = step e2
step (Mod e1 e2) = Mod e3 e2 where e3 = step e1
step (Eq (Num n1) (Num n2)) = BoolE (n1 == n2)
step (Eq (Num n1) e2) = Eq (Num n1) e3 where e3 = step e2
step (Eq Nil Nil) = BoolE True
step (Eq (Cons e1 e2) Nil) = BoolE False
step (Eq Nil (Cons e1 e2)) = BoolE False
step (Eq (Cons e1 e2) (Cons e3 e4)) = And (Eq e1 e3) (Eq e2 e4)
step (Eq Nil e2) = Eq Nil e3 where e3 = step e2
step (Eq e1 Nil) = Eq e3 Nil where e3 = step e1
step (Eq (Cons e1 e2) e3) = Eq (Cons e1 e2) e4 where e4 = step e3
step (Eq e1 e2) = Eq e3 e2 where e3 = step e1
step (Lt (Num n1) (Num n2)) = BoolE (n1 < n2)
step (Lt (Num n1) e2) = Lt (Num n1) e3 where e3 = step e2
step (Lt e1 e2) = Lt e3 e2 where e3 = step e1
step (Gt (Num n1) (Num n2)) = BoolE (n1 > n2)
step (Gt (Num n1) e2) = Gt (Num n1) e3 where e3 = step e2
step (Gt e1 e2) = Gt e3 e2 where e3 = step e1
step (Le (Num n1) (Num n2)) = BoolE (n1 <= n2)
step (Le (Num n1) e2) = Le (Num n1) e3 where e3 = step e2
step (Le e1 e2) = Le e3 e2 where e3 = step e1
step (Ge (Num n1) (Num n2)) = BoolE (n1 >= n2)
step (Ge (Num n1) e2) = Ge (Num n1) e3 where e3 = step e2
step (Ge e1 e2) = Ge e3 e2 where e3 = step e1
step (And (BoolE b1) (BoolE b2)) = BoolE (b1 && b2)
step (And (BoolE b1) e2) = And (BoolE b1) e3 where e3 = step e2
step (And e1 e2) = And e3 e2 where e3 = step e1
step (Or (BoolE b1) (BoolE b2)) = BoolE (b1 || b2)
step (Or (BoolE b1) e2) = Or (BoolE b1) e3 where e3 = step e2
step (Or e1 e2) = Or e3 e2 where e3 = step e1
step (Not (BoolE b)) = BoolE (not b)
step (Not e1) = Not e2 where e2 = step e1
step (Append Nil Nil) = Nil
step (Append Nil e2) = e2
step (Append e1 Nil) = e1
step (Append (Cons e1 e2) e3) = Cons e1 (Append e2 e3)
step (Append e1 e2) = Append e3 e2 where e3 = step e1
step (App (Lam x _ e1) e2) = subs e1 (x, e2)
step (App e1 e2) = App e3 e2 where e3 = step e1
step (If (BoolE b) e2 e3) = if b then e2 else e3
step (If e1 e2 e3) = If e4 e2 e3 where e4 = step e1
step (Let x e1 e2) = subs e2 (x, Fix x e1)
step (Lam x t e1) = Lam x t e1
step (Fix x e1) = subs e1 (x, Fix x e1)
step s = s

isValue :: Expr -> Bool
isValue (Num _) = True
isValue (BoolE _) = True
isValue Nil = True
isValue (Cons _ _) = True -- falla si es una lista de listas???
isValue (Lam _ _ _) = True
isValue _ = False