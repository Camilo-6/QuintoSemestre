module EAB.Semantic where

import EAB.Sintax

{-|
Method to return the result of evaluating an abstract syntax tree of the EAB
language.
-}
eval :: EAB -> Either Int Bool
eval (Plus e1 e2) = case (eval e1, eval e2) of
  (Left a, Left b) -> Left (a + b)
  _ -> error "Type error"
eval (Times e1 e2) = case (eval e1, eval e2) of
  (Left a, Left b) -> Left (a * b)
  _ -> error "Type error"
eval (Or e1 e2) = case (eval e1, eval e2) of
  (Right a, Right b) -> Right (a || b)
  _ -> error "Type error"
eval (And e1 e2) = case (eval e1, eval e2) of
    (Right a, Right b) -> Right (a && b)
    _ -> error "Type error"
eval (Not e1) = case eval e1 of
    Right a -> Right (not a)
    _ -> error "Type error"
eval (Brack e1) = eval e1
eval (Let x e1 e2) = eval (subst x e1 e2)
eval (Num n) = Left n
eval (Bool b) = Right b
eval (Var x) = error "Free variable"

{-|
Method to substitute a variable in an abstract syntax tree of the EAB language.
-}
subst :: String -> EAB -> EAB -> EAB
subst x e (Plus e1 e2) = Plus (subst x e e1) (subst x e e2)
subst x e (Times e1 e2) = Times (subst x e e1) (subst x e e2)
subst x e (Or e1 e2) = Or (subst x e e1) (subst x e e2)
subst x e (And e1 e2) = And (subst x e e1) (subst x e e2)
subst x e (Not e1) = Not (subst x e e1)
subst x e (Brack e1) = Brack (subst x e e1)
subst x e (Let y e1 e2) = if x == y then if notElem y (freeVars e) then Let y (subst x e e1) e2
                                else error "Undefined variable"
                            else if notElem y (freeVars e) then Let y (subst x e e1) (subst x e e2)
                                else error "Undefined variable"
subst x e (Num n) = Num n
subst x e (Bool b) = Bool b
subst x e (Var y) = if x == y then e else Var y

{-|
Method to return the free variables of an abstract syntax tree of the EAB
language.
-}
freeVars :: EAB -> [String]
freeVars (Plus e1 e2) = freeVars e1 ++ freeVars e2
freeVars (Times e1 e2) = freeVars e1 ++ freeVars e2
freeVars (Or e1 e2) = freeVars e1 ++ freeVars e2
freeVars (And e1 e2) = freeVars e1 ++ freeVars e2
freeVars (Not e1) = freeVars e1
freeVars (Brack e1) = freeVars e1
freeVars (Let x e1 e2) = freeVars e1 ++ filter (/= x) (freeVars e2)
freeVars (Num n) = []
freeVars (Bool b) = []
freeVars (Var x) = [x]