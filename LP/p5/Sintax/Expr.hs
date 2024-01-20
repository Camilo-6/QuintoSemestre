module Sintax.Expr where
import Semantic.Static.Type ( Type )

data Expr
  = Var String
  | Bool Bool
  | Int Int
  | Float Float
  | BinaryOp Op Expr Expr
  | UnaryOp UnaryOp Expr
  | App Expr Expr
  | If Expr Expr Expr
  | Let String Expr Expr
  | Lambda String Type Type Expr
  | Record [(String, Expr)]
  | Prj String Expr
  | Pair Expr Expr
  | Fst Expr
  | Snd Expr
  | Inl Type Expr
  | Inr Type Expr
  | Case Expr String Expr String Expr
  | Fix String Expr
  deriving (Show, Eq)

data UnaryOp = Negate | Not | Pot | Sqrt deriving (Show, Eq)

data Op
  = ArithOp ArithOp
  | CompOp CompOp
  | LogicalOp LogicalOp
  deriving (Show, Eq)

data ArithOp = Plus | Times | Minus | Div | Mod deriving (Show, Eq)

data CompOp = Eq | Lt | Gt | Leq | Geq deriving (Show, Eq)

data LogicalOp = And | Or deriving (Show, Eq)

subst :: Expr -> (String, Expr) -> Expr
subst (Var x) (y, e) = if x == y then e else Var x
subst (Bool b) _ = Bool b
subst (Int n) _ = Int n
subst (Float f) _ = Float f
subst (BinaryOp op e1 e2) s = BinaryOp op (subst e1 s) (subst e2 s)
subst (UnaryOp op e) s = UnaryOp op (subst e s)
subst (App e1 e2) s = App (subst e1 s) (subst e2 s)
subst (If e1 e2 e3) s = If (subst e1 s) (subst e2 s) (subst e3 s)
subst (Let y e3 e4) (x, e2) = if x == y then if notElem y (freeVars e2) then Let y (subst e3 (x, e2)) e4
                                        else Let y e3 e4
                                else if notElem y (freeVars e2) then Let y (subst e3 (x, e2)) (subst e4 (x, e2))
                                        else Let y e3 e4
subst (Lambda y t1 t2 e3) (x, e2) = if x == y then Lambda y t1 t2 e3
                                else if notElem y (freeVars e2) then Lambda y t1 t2 (subst e3 (x, e2))
                                        else Lambda y t1 t2 e3
subst (Record fields) s = Record (map (\(x, e) -> (x, subst e s)) fields)
subst (Prj label e) s = Prj label (subst e s)
subst (Pair e1 e2) s = Pair (subst e1 s) (subst e2 s)
subst (Fst e) s = Fst (subst e s)
subst (Snd e) s = Snd (subst e s)
subst (Inl t e) s = Inl t (subst e s)
subst (Inr t e) s = Inr t (subst e s)
subst (Case e1 x1 e2 x2 e3) (x, e) = Case e4 x1 e5 x2 e6
                                where e4 = subst e1 (x, e)
                                      e5 = if x == x1 then e2 else if notElem x1 (freeVars e) then subst e2 (x, e)
                                            else e2
                                      e6 = if x == x2 then e3 else if notElem x2 (freeVars e) then subst e3 (x, e)
                                            else e3
subst (Fix y e3) (x, e2) = if x == y then Fix y e3
                                else if notElem y (freeVars e2) then Fix y (subst e3 (x, e2))
                                        else Fix y e3

freeVars :: Expr -> [String]
freeVars (Var x) = [x]
freeVars (Bool b) = []
freeVars (Int n) = []
freeVars (Float f) = []
freeVars (BinaryOp _ e1 e2) = freeVars e1 ++ freeVars e2
freeVars (UnaryOp _ e) = freeVars e
freeVars (App e1 e2) = freeVars e1 ++ freeVars e2
freeVars (If e1 e2 e3) = freeVars e1 ++ freeVars e2 ++ freeVars e3
freeVars (Let x e1 e2) = freeVars e1 ++ (filter (/= x) (freeVars e2))
freeVars (Lambda x _ _ e1) = filter (/= x) (freeVars e1)
freeVars (Record fields) = concatMap (\(_, e) -> freeVars e) fields
freeVars (Prj _ e) = freeVars e
freeVars (Pair e1 e2) = freeVars e1 ++ freeVars e2
freeVars (Fst e) = freeVars e
freeVars (Snd e) = freeVars e
freeVars (Inl _ e) = freeVars e
freeVars (Inr _ e) = freeVars e
freeVars (Case e x1 e1 x2 e2) = freeVars e ++ freeVars e1 ++ (filter (/= x1) (freeVars e2)) ++ (filter (/= x2) (freeVars e2))
freeVars (Fix x e) = filter (/= x) (freeVars e)

isValue :: Expr -> Bool
isValue (Var _) = False
isValue (Bool _) = True
isValue (Int _) = True
isValue (Float _) = True
isValue (BinaryOp _ _ _) = False
isValue (UnaryOp _ _) = False
isValue (App _ _) = False
isValue (If _ _ _) = False
isValue (Let _ _ _) = False
isValue (Lambda _ _ _ _) = True
isValue (Record fields) = all (\(_, e) -> isValue e) fields
isValue (Prj _ e) = isValue e
isValue (Pair e1 e2) = isValue e1 && isValue e2
isValue (Fst _) = False
isValue (Snd _) = False
isValue (Inl _ _) = False
isValue (Inr _ _) = False
isValue (Case _ _ _ _ _) = False
isValue (Fix _ _) = False