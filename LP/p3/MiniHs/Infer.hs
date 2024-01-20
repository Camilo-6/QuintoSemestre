module MiniHs.Infer where

import MiniHs.Expr
import Data.List

type Rest = (Type, Type)

type Substitu = (Type, Type)

type Unifier = [Substitu]

infer :: Expr -> Type
infer e1 = searchType e2 (u (rest e2))
    where
        e2 = standExpr e1 []

standExpr :: Expr -> [(String, String)] -> Expr
standExpr (Var var) varMap = case lookup var varMap of
    Just stdVar -> Var stdVar
    Nothing -> Var var
standExpr (Num n) _ = Num n
standExpr (BoolE b) _ = BoolE b
standExpr Nil varMap = NilVar texto
    where
        texto = findUnusedVarName "nil" varMap
standExpr (NilVar a) _ = NilVar a
standExpr (Cons e1 e2) varMap = Cons (standExpr e1 varMap) (standExpr e2 varMap)
standExpr (Head e1) varMap = Head (standExpr e1 varMap)
standExpr (Tail e1) varMap = Tail (standExpr e1 varMap)
standExpr (Plus e1 e2) varMap = Plus (standExpr e1 varMap) (standExpr e2 varMap)
standExpr (Minus e1 e2) varMap = Minus (standExpr e1 varMap) (standExpr e2 varMap)
standExpr (Times e1 e2) varMap = Times (standExpr e1 varMap) (standExpr e2 varMap)
standExpr (Div e1 e2) varMap = Div (standExpr e1 varMap) (standExpr e2 varMap)
standExpr (Mod e1 e2) varMap = Mod (standExpr e1 varMap) (standExpr e2 varMap)
standExpr (Eq e1 e2) varMap = Eq (standExpr e1 varMap) (standExpr e2 varMap)
standExpr (Lt e1 e2) varMap = Lt (standExpr e1 varMap) (standExpr e2 varMap)
standExpr (Gt e1 e2) varMap = Gt (standExpr e1 varMap) (standExpr e2 varMap)
standExpr (Le e1 e2) varMap = Le (standExpr e1 varMap) (standExpr e2 varMap)
standExpr (Ge e1 e2) varMap = Ge (standExpr e1 varMap) (standExpr e2 varMap)
standExpr (And e1 e2) varMap = And (standExpr e1 varMap) (standExpr e2 varMap)
standExpr (Or e1 e2) varMap = Or (standExpr e1 varMap) (standExpr e2 varMap)
standExpr (Not e1) varMap = Not (standExpr e1 varMap)
standExpr (Append e1 e2) varMap = Append (standExpr e1 varMap) (standExpr e2 varMap)
standExpr (App e1 e2) varMap = App (standExpr e1 varMap) (standExpr e2 varMap)
standExpr (If e1 e2 e3) varMap = If (standExpr e1 varMap) (standExpr e2 varMap) (standExpr e3 varMap)
standExpr (Let var e1 e2) varMap = Let standarVar standarE1 standarE2
    where
        standarVar = findUnusedVarName var varMap
        newVarMap = (var, standarVar) : varMap
        standarE1 = standExpr e1 varMap
        standarE2 = standExpr e2 newVarMap
standExpr (Lam var t e1) varMap = Lam standarVar t standarE1
    where
        standarVar = findUnusedVarName var varMap
        newVarMap = (var, standarVar) : varMap
        standarE1 = standExpr e1 newVarMap
standExpr e varMap = e

findUnusedVarName :: String -> [(String, String)] -> String
findUnusedVarName var varMap = if candVar `elem` map snd varMap then findUnusedVarName var varMap else candVar
    where
        candVar = var ++ show (length $ filter (\(x, _) -> x == var) varMap)

rest :: Expr -> [Rest]
rest (Var x) = [(TyOf (Var x), TyVar x)]
rest (Num n) = [(TyOf (Num n), Nat)]
rest (BoolE b) = [(TyOf (BoolE b), BooleaN)]
rest (NilVar a) = [(TyOf (NilVar a), ListOf (TyVar a))]
rest (Cons e1 e2) = rest e1 `union` rest e2 `union` [(TyOf (Cons e1 e2), ListOf (TyOf e1)), (TyOf e2, ListOf (TyOf e1))]
rest (Head e1) = rest e1 `union` [(TyOf e1, ListOf (TyOf (Head e1)))]
rest (Tail e1) = rest e1 `union` [(TyOf (Tail e1), TyOf e1)]
rest (Plus e1 e2) = rest e1 `union` rest e2 `union` [(TyOf e1, Nat), (TyOf e2, Nat), (TyOf (Plus e1 e2), Nat)]
rest (Minus e1 e2) = rest e1 `union` rest e2 `union` [(TyOf e1, Nat), (TyOf e2, Nat), (TyOf (Minus e1 e2), Nat)]
rest (Times e1 e2) = rest e1 `union` rest e2 `union` [(TyOf e1, Nat), (TyOf e2, Nat), (TyOf (Times e1 e2), Nat)]
rest (Div e1 e2) = rest e1 `union` rest e2 `union` [(TyOf e1, Nat), (TyOf e2, Nat), (TyOf (Div e1 e2), Nat)]
rest (Mod e1 e2) = rest e1 `union` rest e2 `union` [(TyOf e1, Nat), (TyOf e2, Nat), (TyOf (Mod e1 e2), Nat)]
rest (Eq e1 e2) = rest e1 `union` rest e2 `union` [(TyOf e1, TyOf e2), (TyOf (Eq e1 e2), BooleaN)]
rest (Lt e1 e2) = rest e1 `union` rest e2 `union` [(TyOf e1, Nat), (TyOf e2, Nat), (TyOf (Lt e1 e2), BooleaN)]
rest (Gt e1 e2) = rest e1 `union` rest e2 `union` [(TyOf e1, Nat), (TyOf e2, Nat), (TyOf (Gt e1 e2), BooleaN)]
rest (Le e1 e2) = rest e1 `union` rest e2 `union` [(TyOf e1, Nat), (TyOf e2, Nat), (TyOf (Le e1 e2), BooleaN)]
rest (Ge e1 e2) = rest e1 `union` rest e2 `union` [(TyOf e1, Nat), (TyOf e2, Nat), (TyOf (Ge e1 e2), BooleaN)]
rest (And e1 e2) = rest e1 `union` rest e2 `union` [(TyOf e1, BooleaN), (TyOf e2, BooleaN), (TyOf (And e1 e2), BooleaN)]
rest (Or e1 e2) = rest e1 `union` rest e2 `union` [(TyOf e1, BooleaN), (TyOf e2, BooleaN), (TyOf (Or e1 e2), BooleaN)]
rest (Not e1) = rest e1 `union` [(TyOf e1, BooleaN), (TyOf (Not e1), BooleaN)]
rest (Append e1 e2) = rest e1 `union` rest e2 `union` [(TyOf e1, TyOf e2), (TyOf (Append e1 e2), TyOf e1), (TyOf (Append e1 e2), TyOf e2)]
rest (App e1 e2) = rest e1 `union` rest e2 `union` [(TyOf e1, (Arrow (TyOf e2) (TyOf (App e1 e2))))]
rest (If e1 e2 e3) = rest e1 `union` rest e2 `union` rest e3 `union` [(TyOf e1, BooleaN), (TyOf e2, TyOf e3), (TyOf (If e1 e2 e3), TyOf e2), (TyOf (If e1 e2 e3), TyOf e3)]
rest (Let x e1 e2) = rest e1 `union` rest e2 `union` [(TyVar x, TyOf e1), (TyOf (Let x e1 e2), TyOf e2)]
rest (Lam x t e1) = rest e1 `union` [(TyOf (Lam x t e1), Arrow (TyVar x) (TyOf e1))]
rest _ = []

u :: [Rest] -> Unifier
u [] = []
u ((t1, t2):rs)
    | t1 == t2 = u rs
u ((TyVar x, t):rs)
    | elem x (tvars t) = error "fail unificar var"
    | otherwise = unionU (u (subsLR rs (TyVar x, t))) (TyVar x, t)
u ((TyOf e, t):rs) = unionU (u (subsLR rs (TyOf e, t))) (TyOf e, t)
u ((t, TyVar x):rs) = u ((TyVar x, t):rs)
u ((t, TyOf e):rs) = u ((TyOf e, t):rs)
u ((Arrow t1 t2, Arrow t3 t4):rs) = u ((t1, t3):(t2, t4):rs)
u (r:rs) = error texto
    where
        texto = "fail unificar " ++ show r

unionU :: Unifier -> Substitu -> Unifier
unionU u1 s1 = [s1] `union` map (`subsR` s1) u1

searchType :: Expr -> Unifier -> Type
searchType e1 (((TyOf e2, t)):us) = if e1 == e2 then t else searchType e1 us
searchType e1 (u:us) = searchType e1 us
searchType e1 [] = error "fail buscar tipo"

subsR :: Rest -> Substitu -> Rest
subsR (t1, t2) s = (subsT t1 s, subsT t2 s)

subsLR :: [Rest] -> Substitu -> [Rest]
subsLR [] _ = []
subsLR (r:rs) s = (subsR r s):(subsLR rs s)

subsT :: Type -> Substitu -> Type
subsT (Nat) (t1, t2) = Nat
subsT (BooleaN) (t1, t2) = BooleaN
subsT (Arrow t1 t2) (t3, t4) = Arrow (subsT t1 (t3, t4)) (subsT t2 (t3, t4))
subsT (ListOf t1) (t2, t3) = ListOf (subsT t1 (t2, t3))
subsT t1 (t2, t3) = if t1 == t2 then t3 else t1

tvars :: Type -> [String]
tvars (TyVar x) = [x]
tvars (Arrow t1 t2) = tvars t1 `union` tvars t2
tvars (ListOf t) = tvars t
tvars _ = []
