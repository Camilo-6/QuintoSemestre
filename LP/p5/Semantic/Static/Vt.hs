
module Semantic.Static.Vt where
import Sintax.Expr
import Semantic.Static.Type
import Semantic.Static.Sub
import Data.Map (Map)

type Ctx = [(String, Type)]

vt :: Ctx -> Expr -> Type
vt ctx (Var x) = case lookup x ctx of
    Just t -> t
    Nothing -> error "variable libre"
vt c (Bool _) = TBool
vt c (Int _) = TInt
vt c (Float _) = TFloat
vt ctx (BinaryOp (ArithOp op) e1 e2) =
    let t1 = vt ctx e1
        t2 = vt ctx e2
    in case op of
        Plus -> case (t1, t2) of
            (TInt, TInt) -> TInt
            (TFloat, TFloat) -> TFloat
            (TInt, TFloat) -> TFloat
            (TFloat, TInt) -> TFloat
            _ -> error "tipos no compatibles"
        Times -> case (t1, t2) of
            (TInt, TInt) -> TInt
            (TFloat, TFloat) -> TFloat
            (TInt, TFloat) -> TFloat
            (TFloat, TInt) -> TFloat
            _ -> error "tipos no compatibles"
        Minus -> case (t1, t2) of
            (TInt, TInt) -> TInt
            (TFloat, TFloat) -> TFloat
            (TInt, TFloat) -> TFloat
            (TFloat, TInt) -> TFloat
            _ -> error "tipos no compatibles"
        Div -> case (t1, t2) of
            (TInt, TInt) -> TInt
            (TFloat, TFloat) -> TFloat
            (TInt, TFloat) -> TFloat
            (TFloat, TInt) -> TFloat
            _ -> error "tipos no compatibles"
        Mod -> case (t1, t2) of
            (TInt, TInt) -> TInt
            (TFloat, TFloat) -> TFloat
            (TInt, TFloat) -> TFloat
            (TFloat, TInt) -> TFloat
            _ -> error "tipos no compatibles"
vt ctx (BinaryOp (CompOp op) e1 e2) =
    let t1 = vt ctx e1
        t2 = vt ctx e2
    in case op of
        Eq -> case (t1, t2) of
            (TInt, TInt) -> TBool
            (TFloat, TFloat) -> TBool
            (TInt, TFloat) -> TBool
            (TFloat, TInt) -> TBool
            (TBool, TBool) -> TBool
            _ -> error "tipos no compatibles"
        Lt -> case (t1, t2) of
            (TInt, TInt) -> TBool
            (TFloat, TFloat) -> TBool
            (TInt, TFloat) -> TBool
            (TFloat, TInt) -> TBool
            _ -> error "tipos no compatibles"
        Gt -> case (t1, t2) of
            (TInt, TInt) -> TBool
            (TFloat, TFloat) -> TBool
            (TInt, TFloat) -> TBool
            (TFloat, TInt) -> TBool
            _ -> error "tipos no compatibles"
        Leq -> case (t1, t2) of
            (TInt, TInt) -> TBool
            (TFloat, TFloat) -> TBool
            (TInt, TFloat) -> TBool
            (TFloat, TInt) -> TBool
            _ -> error "tipos no compatibles"
        Geq -> case (t1, t2) of
            (TInt, TInt) -> TBool
            (TFloat, TFloat) -> TBool
            (TInt, TFloat) -> TBool
            (TFloat, TInt) -> TBool
            _ -> error "tipos no compatibles"
vt ctx (BinaryOp (LogicalOp op) e1 e2) =
    let t1 = vt ctx e1
        t2 = vt ctx e2
    in case op of
        And -> case (t1, t2) of
            (TBool, TBool) -> TBool
            _ -> error "tipos no compatibles"
        Or -> case (t1, t2) of
            (TBool, TBool) -> TBool
            _ -> error "tipos no compatibles"
vt ctx (UnaryOp op e) =
    let t = vt ctx e
    in case op of
        Negate -> case t of
            TInt -> TInt
            TFloat -> TFloat
            _ -> error "tipos no compatibles"
        Not -> case t of
            TBool -> TBool
            _ -> error "tipos no compatibles"
        Pot -> case t of
            TInt -> TInt
            TFloat -> TFloat
            _ -> error "tipos no compatibles"
        Sqrt -> case t of
            TInt -> TFloat
            TFloat -> TFloat
            _ -> error "tipos no compatibles"
vt ctx (App e1 e2) =
    let t1 = vt ctx e1
    in case t1 of
        TFunc t2 t3 -> if sub (vt ctx e2) t2 then t3 else error "tipos no compatibles con la expresion "
        _ -> error "tipos no compatibles"
vt ctx (If e1 e2 e3) =
    let t1 = vt ctx e1
        t2 = vt ctx e2
        t3 = vt ctx e3
    in case t1 of
        TBool -> if (comp t2 t3) then greaT t2 t3 else error "tipos no compatibles"
        _ -> error "tipos no compatibles"
vt ctx (Let x e1 e2) =
    let t1 = if notElem x (freeVars e1) then vt ctx e1
                else case e1 of
                    Lambda y t1 t2 e -> TFunc t1 t2
                    _ -> error "tipo no encontrado"
    in vt ((x, t1) : ctx) e2
vt ctx (Lambda x t1 t2 e) =
    if t3 == t2 then TFunc t1 t3 else error "lambda no compatible"
    where t3 = vt ((x, t1) : ctx) e
vt ctx (Record fields) =
    let types = map (\(label, e) -> (label, vt ctx e)) fields
    in TRecord types
vt ctx (Prj label e) =
    let t = vt ctx e
    in case t of
        TRecord types -> case lookup label types of
            Just t -> t
            Nothing -> error "tipo no encontrado"
        _ -> error "tipo no encontrado"
vt ctx (Pair e1 e2) =
    let t1 = vt ctx e1
        t2 = vt ctx e2
    in TProd t1 t2
vt ctx (Fst e) =
    let t = vt ctx e
    in case t of
        TProd t1 t2 -> t1
        _ -> error "tipo no encontrado"
vt ctx (Snd e) =
    let t = vt ctx e
    in case t of
        TProd t1 t2 -> t2
        _ -> error "tipo no encontrado"
vt ctx (Inl t e) =
    let t1 = vt ctx e
    in TSum t1 t
vt ctx (Inr t e) =
    let t1 = vt ctx e
    in TSum t t1
vt ctx (Case e x1 e1 x2 e2) =
    let t = vt ctx e
    in case t of
        TSum t1 t2 -> let t3 = vt ((x1, t1) : ctx) e1
                          t4 = vt ((x2, t2) : ctx) e2
                      in if comp t3 t4 then greaT t3 t4 else error "tipos no compatibles"
        _ -> error "tipo no encontrado"

comp :: Type -> Type -> Bool
comp t1 t2 = sub t1 t2 || sub t2 t1

greaT :: Type -> Type -> Type
greaT t1 t2 = if sub t1 t2 then t2 else t1

check :: Ctx -> Expr -> Type -> Type
check ctx e expected
    | sub real expected = expected
    | otherwise         = error "Tipos no compatibles"
    where real = vt ctx e