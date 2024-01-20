module Semantic.Dynamic.Inter where
import Sintax.Expr

evalStep :: Expr -> Expr
evalStep (Var x) = Var x
evalStep (Bool b) = Bool b
evalStep (Int n) = Int n
evalStep (Float f) = Float f
evalStep (BinaryOp (ArithOp op) e1 e2) = case op of
    Plus -> case (evalStep e1, evalStep e2) of
        (Int n1, Int n2) -> Int (n1 + n2)
        (Float f1, Float f2) -> Float (f1 + f2)
        (Int n1, Float f2) -> Float (fromIntegral n1 + f2)
        (Float f1, Int n2) -> Float (f1 + fromIntegral n2)
        _ -> BinaryOp (ArithOp op) e1 e2
    Times -> case (evalStep e1, evalStep e2) of
        (Int n1, Int n2) -> Int (n1 * n2)
        (Float f1, Float f2) -> Float (f1 * f2)
        (Int n1, Float f2) -> Float (fromIntegral n1 * f2)
        (Float f1, Int n2) -> Float (f1 * fromIntegral n2)
        _ -> BinaryOp (ArithOp op) e1 e2
    Minus -> case (evalStep e1, evalStep e2) of
        (Int n1, Int n2) -> Int (n1 - n2)
        (Float f1, Float f2) -> Float (f1 - f2)
        (Int n1, Float f2) -> Float (fromIntegral n1 - f2)
        (Float f1, Int n2) -> Float (f1 - fromIntegral n2)
        _ -> BinaryOp (ArithOp op) e1 e2
    Div -> case (evalStep e1, evalStep e2) of
        (Int n1, Int n2) -> Int (n1 `div` n2)
        (Float f1, Float f2) -> Float (f1 / f2)
        (Int n1, Float f2) -> Float (fromIntegral n1 / f2)
        (Float f1, Int n2) -> Float (f1 / fromIntegral n2)
        _ -> BinaryOp (ArithOp op) e1 e2
    Mod -> case (evalStep e1, evalStep e2) of
        (Int n1, Int n2) -> Int (n1 `mod` n2)
        _ -> BinaryOp (ArithOp op) e1 e2
evalStep (BinaryOp (CompOp op) e1 e2) = case op of
    Eq -> case (evalStep e1, evalStep e2) of
        (Int n1, Int n2) -> Bool (n1 == n2)
        (Float f1, Float f2) -> Bool (f1 == f2)
        (Int n1, Float f2) -> Bool (fromIntegral n1 == f2)
        (Float f1, Int n2) -> Bool (f1 == fromIntegral n2)
        (Bool b1, Bool b2) -> Bool (b1 == b2)
        _ -> BinaryOp (CompOp op) e1 e2
    Lt -> case (evalStep e1, evalStep e2) of
        (Int n1, Int n2) -> Bool (n1 < n2)
        (Float f1, Float f2) -> Bool (f1 < f2)
        (Int n1, Float f2) -> Bool (fromIntegral n1 < f2)
        (Float f1, Int n2) -> Bool (f1 < fromIntegral n2)
        _ -> BinaryOp (CompOp op) e1 e2
    Gt -> case (evalStep e1, evalStep e2) of
        (Int n1, Int n2) -> Bool (n1 > n2)
        (Float f1, Float f2) -> Bool (f1 > f2)
        (Int n1, Float f2) -> Bool (fromIntegral n1 > f2)
        (Float f1, Int n2) -> Bool (f1 > fromIntegral n2)
        _ -> BinaryOp (CompOp op) e1 e2
    Leq -> case (evalStep e1, evalStep e2) of
        (Int n1, Int n2) -> Bool (n1 <= n2)
        (Float f1, Float f2) -> Bool (f1 <= f2)
        (Int n1, Float f2) -> Bool (fromIntegral n1 <= f2)
        (Float f1, Int n2) -> Bool (f1 <= fromIntegral n2)
        _ -> BinaryOp (CompOp op) e1 e2
    Geq -> case (evalStep e1, evalStep e2) of
        (Int n1, Int n2) -> Bool (n1 >= n2)
        (Float f1, Float f2) -> Bool (f1 >= f2)
        (Int n1, Float f2) -> Bool (fromIntegral n1 >= f2)
        (Float f1, Int n2) -> Bool (f1 >= fromIntegral n2)
        _ -> BinaryOp (CompOp op) e1 e2
evalStep (BinaryOp (LogicalOp op) e1 e2) = case op of
    And -> case evalStep e1 of
        Bool True -> evalStep e2
        Bool False -> Bool False
        _ -> BinaryOp (LogicalOp op) e1 e2
    Or -> case evalStep e1 of
        Bool True -> Bool True
        Bool False -> evalStep e2
        _ -> BinaryOp (LogicalOp op) e1 e2
evalStep (UnaryOp op e) = case op of
    Negate -> case evalStep e of
        Int n -> Int (-n)
        Float f -> Float (-f)
        _ -> UnaryOp op e
    Not -> case evalStep e of
        Bool b -> Bool (not b)
        _ -> UnaryOp op e
    Pot -> case evalStep e of
        Int n -> Int (n ^ 2)
        Float f -> Float (f ^ 2)
        _ -> UnaryOp op e
    Sqrt -> case evalStep e of
        Int n -> Float (fromIntegral n ** 0.5)
        Float f -> Float (sqrt f)
        _ -> UnaryOp op e
evalStep (App (Lambda x t1 t2 e1) e2) = if isValue e2 then subst e1 (x, e2) else App (Lambda x t1 t2 e1) step2 where step2 = evalStep e2
evalStep (App e1 e2) = App e3 e2 where e3 = evalStep e1
evalStep (If e1 e2 e3) = case evalStep e1 of
    Bool True -> e2
    Bool False -> e3
    _ -> If e4 e2 e3 where e4 = evalStep e1
evalStep (Let x e1 e2) = if isValue e1 then subst e2 (x, Fix x e1) else Let x e3 e2 where e3 = evalStep e1
evalStep (Lambda x t1 t2 e) = Lambda x t1 t2 e
evalStep (Record fields) = Record (map (\(x, e) -> (x, evalStep e)) fields)
evalStep (Prj label (Record fields)) = case lookup label fields of
    Just e -> e
    Nothing -> error "no existe el campo"
evalStep (Prj label e) = Prj label e2 where e2 = evalStep e
evalStep (Pair e1 e2) = Pair e3 e4 where e3 = evalStep e1; e4 = evalStep e2
evalStep (Fst e) = case evalStep e of
    Pair e1 e2 -> e1
    _ -> Fst e
evalStep (Snd e) = case evalStep e of
    Pair e1 e2 -> e2
    _ -> Snd e
evalStep (Inl t e) = Inl t e2 where e2 = evalStep e
evalStep (Inr t e) = Inr t e2 where e2 = evalStep e
evalStep (Case e1 x e2 y e3) = case evalStep e1 of
    Inl _ e -> subst e2 (x, e)
    Inr _ e -> subst e3 (y, e)
    _ -> Case e4 x e2 y e3 where e4 = evalStep e1
evalStep (Fix x e) = subst e (x, Fix x e)

eval :: Expr -> Expr
eval e = if e == e2 then e else eval e2 where e2 = evalStep e