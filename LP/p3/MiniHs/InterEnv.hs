module MiniHs.InterEnv where
-- reimplemntacion interprete

import MiniHs.Expr
import MiniHs.Inter
import MiniHs.Env

type State = (Expr, Env Expr)

inter :: Expr -> Value
inter e = toValue (a) where (a, b) = inter3 (e, [])

inter3 :: State -> State
inter3 e1 = if e1 == e2 then e1 else inter3 e2 where e2 = MiniHs.InterEnv.step e1

step :: State -> State
step (Var x, env) = case (lookUp x env) of
    Nothing -> (Var x, env)
    Just e -> (EvalVar x e, env)
--step (EvalVar x e, env) = if not (isValue e) then (EvalVar x e2, env2) else (e, insert x e env) where (e2, env2) = MiniHs.InterEnv.step (e, env)
--step (EvalVar x e, env) = (e, insert x e env) -- experimental
step (EvalVar x e, env) = (e, env) -- experimental2???
step (Num n, env) = (Num n, env)
step (BoolE b, env) = (BoolE b, env)
step (Nil, env) = (Nil, env)
step (Cons Nil e1, env) = (e1, env)
step (Cons e1 e2, env) = if isValue e1 then (Cons e1 e4, env3) else (Cons e3 e2, env2) where (e3, env2) = MiniHs.InterEnv.step (e1, env); (e4, env3) = MiniHs.InterEnv.step (e2, env)
step (Head (Cons e1 e2), env) = (e1, env)
step (Head Nil, env) = (Nil, env)
step (Head e1, env) = (Head e2, env2) where (e2, env2) = MiniHs.InterEnv.step (e1, env)
step (Tail (Cons e1 e2), env) = (e2, env)
step (Tail Nil, env) = (Nil, env)
step (Tail e1, env) = (Tail e2, env2) where (e2, env2) = MiniHs.InterEnv.step (e1, env)
step (Plus (Num n1) (Num n2), env) = (Num (n1 + n2), env)
step (Plus (Num n1) e2, env) = (Plus (Num n1) e3, env2) where (e3, env2) = MiniHs.InterEnv.step (e2, env)
step (Plus e1 e2, env) = (Plus e3 e2, env2) where (e3, env2) = MiniHs.InterEnv.step (e1, env)
step (Minus (Num n1) (Num n2), env) = (Num (n1 - n2), env)
step (Minus (Num n1) e2, env) = (Minus (Num n1) e3, env2) where (e3, env2) = MiniHs.InterEnv.step (e2, env)
step (Minus e1 e2, env) = (Minus e3 e2, env2) where (e3, env2) = MiniHs.InterEnv.step (e1, env)
step (Times (Num n1) (Num n2), env) = (Num (n1 * n2), env)
step (Times (Num n1) e2, env) = (Times (Num n1) e3, env2) where (e3, env2) = MiniHs.InterEnv.step (e2, env)
step (Times e1 e2, env) = (Times e3 e2, env2) where (e3, env2) = MiniHs.InterEnv.step (e1, env)
step (Div (Num n1) (Num n2), env) = (Num (div n1 n2), env)
step (Div (Num n1) e2, env) = (Div (Num n1) e3, env2) where (e3, env2) = MiniHs.InterEnv.step (e2, env)
step (Div e1 e2, env) = (Div e3 e2, env2) where (e3, env2) = MiniHs.InterEnv.step (e1, env)
step (Mod (Num n1) (Num n2), env) = (Num (mod n1 n2), env)
step (Mod (Num n1) e2, env) = (Mod (Num n1) e3, env2) where (e3, env2) = MiniHs.InterEnv.step (e2, env)
step (Mod e1 e2, env) = (Mod e3 e2, env2) where (e3, env2) = MiniHs.InterEnv.step (e1, env)
step (Eq (Num n1) (Num n2), env) = (BoolE (n1 == n2), env)
step (Eq (Num n1) e2, env) = (Eq (Num n1) e3, env2) where (e3, env2) = MiniHs.InterEnv.step (e2, env)
step (Eq Nil Nil, env) = (BoolE True, env)
step (Eq (Cons e1 e2) Nil, env) = (BoolE False, env)
step (Eq Nil (Cons e1 e2), env) = (BoolE False, env)
step (Eq (Cons e1 e2) (Cons e3 e4), env) = (And (Eq e1 e3) (Eq e2 e4), env)
step (Eq Nil e2, env) = (Eq Nil e3, env2) where (e3, env2) = MiniHs.InterEnv.step (e2, env)
step (Eq e1 Nil, env) = (Eq e3 Nil, env2) where (e3, env2) = MiniHs.InterEnv.step (e1, env)
step (Eq (Cons e1 e2) e3, env) = (Eq (Cons e1 e2) e4, env2) where (e4, env2) = MiniHs.InterEnv.step (e3, env)
step (Eq e1 e2, env) = (Eq e3 e2, env2) where (e3, env2) = MiniHs.InterEnv.step (e1, env)
step (Lt (Num n1) (Num n2), env) = (BoolE (n1 < n2), env)
step (Lt (Num n1) e2, env) = (Lt (Num n1) e3, env2) where (e3, env2) = MiniHs.InterEnv.step (e2, env)
step (Lt e1 e2, env) = (Lt e3 e2, env2) where (e3, env2) = MiniHs.InterEnv.step (e1, env)
step (Gt (Num n1) (Num n2), env) = (BoolE (n1 > n2), env)
step (Gt (Num n1) e2, env) = (Gt (Num n1) e3, env2) where (e3, env2) = MiniHs.InterEnv.step (e2, env)
step (Gt e1 e2, env) = (Gt e3 e2, env2) where (e3, env2) = MiniHs.InterEnv.step (e1, env)
step (Le (Num n1) (Num n2), env) = (BoolE (n1 <= n2), env)
step (Le (Num n1) e2, env) = (Le (Num n1) e3, env2) where (e3, env2) = MiniHs.InterEnv.step (e2, env)
step (Le e1 e2, env) = (Le e3 e2, env2) where (e3, env2) = MiniHs.InterEnv.step (e1, env)
step (Ge (Num n1) (Num n2), env) = (BoolE (n1 >= n2), env)
step (Ge (Num n1) e2, env) = (Ge (Num n1) e3, env2) where (e3, env2) = MiniHs.InterEnv.step (e2, env)
step (Ge e1 e2, env) = (Ge e3 e2, env2) where (e3, env2) = MiniHs.InterEnv.step (e1, env)
step (And (BoolE b1) (BoolE b2), env) = (BoolE (b1 && b2), env)
step (And (BoolE b1) e2, env) = (And (BoolE b1) e3, env2) where (e3, env2) = MiniHs.InterEnv.step (e2, env)
step (And e1 e2, env) = (And e3 e2, env2) where (e3, env2) = MiniHs.InterEnv.step (e1, env)
step (Or (BoolE b1) (BoolE b2), env) = (BoolE (b1 || b2), env)
step (Or (BoolE b1) e2, env) = (Or (BoolE b1) e3, env2) where (e3, env2) = MiniHs.InterEnv.step (e2, env)
step (Or e1 e2, env) = (Or e3 e2, env2) where (e3, env2) = MiniHs.InterEnv.step (e1, env)
step (Not (BoolE b), env) = (BoolE (not b), env)
step (Not e1, env) = (Not e2, env2) where (e2, env2) = MiniHs.InterEnv.step (e1, env)
step (Append Nil Nil, env) = (Nil, env)
step (Append Nil e2, env) = (e2, env)
step (Append e1 Nil, env) = (e1, env)
step (Append (Cons e1 e2) e3, env) = (Cons e1 (Append e2 e3), env)
step (Append e1 e2, env) = (Append e3 e2, env2) where (e3, env2) = MiniHs.InterEnv.step (e1, env)
step (If (BoolE b) e1 e2, env) = if b then (e1, env) else (e2, env)
step (If e1 e2 e3, env) = (If e4 e2 e3, env2) where (e4, env2) = MiniHs.InterEnv.step (e1, env)
step (App (Fix z (Cl envCl x e1)) (Var y), env) = case (lookup y env) of --(este paso ayuda a la aplicacion)
    Nothing -> (EnvHolder env e1, env3) where env3 = insert x (Var y) env2; env2 = insert z (Fix z (Cl envCl x e1)) envCl
    Just e -> (EnvHolder env e1, env3) where env3 = insert x e env2; env2 = insert z (Fix z (Cl envCl x e1)) envCl
{-
step (App (Fix y (Cl envCl x e1)) e2, env) = case (isValue e2) of --(este paso ya no es paso pequeño)
    True -> (EnvHolder env e1, env3) where env3 = insert x e2 env2; env2 = insert y (Fix y (Cl envCl x e1)) envCl
    False -> (App (Fix y (Cl envCl x e1)) e3, env2) where (e3, env2) = MiniHs.InterEnv.step (e2, env)
-}
-- step (App (Fix y (Cl envCl x e1)) e2, env) = (EnvHolder env e1, env3) where env3 = insert x e2 env2; env2 = insert y (Fix y (Cl envCl x e1)) envCl -- original
step (App (Fix y (Cl envCl x e1)) e2, env) = case notElem x (freeVars e2) of --(este paso ayuda a la aplicacion)
    True -> (EnvHolder env e1, env3) where env3 = insert x e2 env2; env2 = insert y (Fix y (Cl envCl x e1)) envCl
    False -> (App (Fix y (Cl envCl x e1)) e3, env2) where (e3, env2) = MiniHs.InterEnv.step (e2, env)
step (App e1 e2, env) = (App e3 e2, env2) where (e3, env2) = MiniHs.InterEnv.step (e1, env)
step (Let y (Lam x t e) e2, env) = (EnvHolder env e2, env2) where env2 = insert y (Fix y (Cl env x e)) env -- (este paso ayuda que pgm2 de 7 y no 9)
step (Let x e1 e2, env) = (EnvHolder env e2, env2) where env2 = insert x e1 env
step (Lam x t e, env) = (Fix x (Cl env x e), env)
step (EnvHolder envH e, env) = if not (isValue e) then (EnvHolder envH e2, env2) else (e, envH) where (e2, env2) = MiniHs.InterEnv.step (e, env)
step s = s

lookUp :: String -> Env Expr -> Maybe Expr
lookUp x [] = Nothing
lookUp x ((y, e):env) = if x == y then Just e else lookUp x env

insert :: String -> Expr -> Env Expr -> Env Expr
insert x e env = [(x, e)] ++ env
