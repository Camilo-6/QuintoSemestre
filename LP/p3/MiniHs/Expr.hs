module MiniHs.Expr where
-- definir tipo de dato, sustitucion, etc

import MiniHs.Env

data Expr = Var String
        | Num Int
        | BoolE Bool
        | Nil
        | NilVar String
        | Cons Expr Expr
        | Head Expr
        | Tail Expr
        | Plus Expr Expr
        | Minus Expr Expr
        | Times Expr Expr
        | Div Expr Expr
        | Mod Expr Expr
        | Eq Expr Expr
        | Lt Expr Expr
        | Gt Expr Expr
        | Le Expr Expr
        | Ge Expr Expr
        | And Expr Expr
        | Or Expr Expr
        | Not Expr
        | Append Expr Expr
        | App Expr Expr
        | If Expr Expr Expr
        | Let String Expr Expr
        | Lam String Type Expr
        | Fix String Expr
        | EnvHolder (Env Expr) Expr
        | EvalVar String Expr
        | Cl (Env Expr) String Expr
        deriving (Show, Eq)

data Type = Nat
        | BooleaN
        | Arrow Type Type
        | ListOf Type
        | TyOf Expr
        | TyVar String
        deriving (Show, Eq)

subs :: Expr -> (String, Expr) -> Expr
subs (Var y) (x, e2) = if x == y then e2 else Var y
subs (Num n) _ = Num n
subs (BoolE b) _ = BoolE b
subs Nil _ = Nil
subs (Cons e3 e4) (x, e2) = Cons (subs e3 (x, e2)) (subs e4 (x, e2))
subs (Head e3) (x, e2) = Head (subs e3 (x, e2))
subs (Tail e3) (x, e2) = Tail (subs e3 (x, e2))
subs (Plus e3 e4) (x, e2) = Plus (subs e3 (x, e2)) (subs e4 (x, e2))
subs (Minus e3 e4) (x, e2) = Minus (subs e3 (x, e2)) (subs e4 (x, e2))
subs (Times e3 e4) (x, e2) = Times (subs e3 (x, e2)) (subs e4 (x, e2))
subs (Div e3 e4) (x, e2) = Div (subs e3 (x, e2)) (subs e4 (x, e2))
subs (Mod e3 e4) (x, e2) = Mod (subs e3 (x, e2)) (subs e4 (x, e2))
subs (Eq e3 e4) (x, e2) = Eq (subs e3 (x, e2)) (subs e4 (x, e2))
subs (Lt e3 e4) (x, e2) = Lt (subs e3 (x, e2)) (subs e4 (x, e2))
subs (Gt e3 e4) (x, e2) = Gt (subs e3 (x, e2)) (subs e4 (x, e2))
subs (Le e3 e4) (x, e2) = Le (subs e3 (x, e2)) (subs e4 (x, e2))
subs (Ge e3 e4) (x, e2) = Ge (subs e3 (x, e2)) (subs e4 (x, e2))
subs (And e3 e4) (x, e2) = And (subs e3 (x, e2)) (subs e4 (x, e2))
subs (Or e3 e4) (x, e2) = Or (subs e3 (x, e2)) (subs e4 (x, e2))
subs (Not e3) (x, e2) = Not (subs e3 (x, e2))
subs (Append e3 e4) (x, e2) = Append (subs e3 (x, e2)) (subs e4 (x, e2))
subs (App e3 e4) (x, e2) = App (subs e3 (x, e2)) (subs e4 (x, e2))
subs (If e3 e4 e5) (x, e2) = If (subs e3 (x, e2)) (subs e4 (x, e2)) (subs e5 (x, e2))
subs (Let y e3 e4) (x, e2) = if x == y then if notElem y (freeVars e2) then Let y (subs e3 (x, e2)) e4
                                        else Let y e3 e4
                                else if notElem y (freeVars e2) then Let y (subs e3 (x, e2)) (subs e4 (x, e2))
                                        else Let y e3 e4
subs (Lam y t e3) (x, e2) = if x == y then Lam y t e3
                                else if notElem y (freeVars e2) then Lam y t (subs e3 (x, e2))
                                        else Lam y t e3
subs (Fix y e3) (x, e2) = if x == y then Fix y e3
                                else if notElem y (freeVars e2) then Fix y (subs e3 (x, e2))
                                        else Fix y e3
subs (e) _ = e

freeVars :: Expr -> [String]
freeVars (Var x) = [x]
freeVars (Num _) = []
freeVars (BoolE _) = []
freeVars Nil = []
freeVars (Cons e1 e2) = freeVars e1 ++ freeVars e2
freeVars (Head e1) = freeVars e1
freeVars (Tail e1) = freeVars e1
freeVars (Plus e1 e2) = freeVars e1 ++ freeVars e2
freeVars (Minus e1 e2) = freeVars e1 ++ freeVars e2
freeVars (Times e1 e2) = freeVars e1 ++ freeVars e2
freeVars (Div e1 e2) = freeVars e1 ++ freeVars e2
freeVars (Mod e1 e2) = freeVars e1 ++ freeVars e2
freeVars (Eq e1 e2) = freeVars e1 ++ freeVars e2
freeVars (Lt e1 e2) = freeVars e1 ++ freeVars e2
freeVars (Gt e1 e2) = freeVars e1 ++ freeVars e2
freeVars (Le e1 e2) = freeVars e1 ++ freeVars e2
freeVars (Ge e1 e2) = freeVars e1 ++ freeVars e2
freeVars (And e1 e2) = freeVars e1 ++ freeVars e2
freeVars (Or e1 e2) = freeVars e1 ++ freeVars e2
freeVars (Not e1) = freeVars e1
freeVars (Append e1 e2) = freeVars e1 ++ freeVars e2
freeVars (App e1 e2) = freeVars e1 ++ freeVars e2
freeVars (If e1 e2 e3) = freeVars e1 ++ freeVars e2 ++ freeVars e3
freeVars (Let x e1 e2) = freeVars e1 ++ (filter (/= x) (freeVars e2))
freeVars (Lam x _ e1) = filter (/= x) (freeVars e1)
freeVars (Fix x e1) = filter (/= x) (freeVars e1)
freeVars (EvalVar x e1) = freeVars e1
freeVars _ = []
