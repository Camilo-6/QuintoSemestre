module While.Eval where

import Data.Map
import While.Expr

evalInt :: Estado -> AExpr -> Int
evalInt e (Var x) = buscar x e
evalInt e (Num n) = n
evalInt e (Plus a1 a2) = evalInt e a1 + evalInt e a2
evalInt e (Times a1 a2) = evalInt e a1 * evalInt e a2
evalInt e (Mod a1 a2) = evalInt e a1 `mod` evalInt e a2
evalInt e (Div a1 a2) = evalInt e a1 `div` evalInt e a2

evalBool :: Estado -> BExpr -> Bool
evalBool e (Bln b) = b
evalBool e (And b1 b2) = evalBool e b1 && evalBool e b2
evalBool e (Or b1 b2) = evalBool e b1 || evalBool e b2
evalBool e (Not b) = not (evalBool e b)
evalBool e (Gt a1 a2) = evalInt e a1 > evalInt e a2
evalBool e (Lt a1 a2) = evalInt e a1 < evalInt e a2
evalBool e (Eq a1 a2) = evalInt e a1 == evalInt e a2

evalSec :: State -> State
evalSec (EvalState p Skip e) = RetState p e
evalSec (EvalState p (New x a) e) = RetState p e2
                                    where e2 = actualizar x (evalInt e a) e
evalSec (EvalState p (Upd x a) e) = RetState p e2
                                    where e2 = actualizar x (evalInt e a) e
evalSec (EvalState p (Seq s1 s2) e) = EvalState p2 s1 e
                                        where p2 = PiM (Secu s2) p
evalSec (RetState (PiM (Secu s) p) e) = EvalState p s e
evalSec (EvalState p (While b s) e) = EvalState p (If1 b (Seq s (While b s))) e
evalSec (EvalState p (If1 b s) e) = EvalState p (If2 b s Skip) e
evalSec (EvalState p (If2 b s1 s2) e) = case evalBool e b of
                                            True -> EvalState p s1 e
                                            False -> EvalState p s2 e
evalSec (EvalState p (TryC s1 s2) e) = EvalState p2 s1 e
                                        where p2 = PiM (Catch s2 e) p
evalSec (RetState (PiM (Catch s e2) p) e) = RetState p e
evalSec (ErrState (PiM (Catch s e2) p) e) = EvalState p s e2
evalSec (EvalState p ErrC e) = ErrState p e
evalSec (ErrState (PiM m p) e) = ErrState p e
evalSec s = s

eval :: Secuencia -> Estado
eval c = case eval2 (EvalState Vacio c Data.Map.empty) of
            RetState Vacio e -> e
            _ -> error "Problema en la ejecucion"

eval2:: State -> State
eval2 s = if s2 == s then s else eval2 s2
            where s2 = evalSec s

evalN :: Secuencia -> Int -> Estado
evalN c n = case evalN2 (EvalState Vacio c Data.Map.empty) n of
                EvalState p s e -> e
                RetState p e -> e
                ErrState p e -> error "Error de ejecucion"

evalN2 :: State -> Int -> State
evalN2 s n = case evalSec s of
                EvalState p s e -> if n == 0 then EvalState p s e else evalN2 (EvalState p s e) (n - 1)
                RetState p e -> if n == 0 then RetState p e else evalN2 (RetState p e) (n - 1)
                ErrState p e -> if n == 0 then ErrState p e else evalN2 (ErrState p e) (n - 1)