module While.Expr where

import Data.Map

type Estado = Map String Int

actualizar :: String -> Int -> Estado -> Estado
actualizar x v e = Data.Map.insert x v e

buscar :: String -> Estado -> Int
buscar x e = case Data.Map.lookup x e of
                Just v -> v
                Nothing -> error $ "Variable " ++ x ++ " no definida"

data Marco = Secu Secuencia | Catch Secuencia Estado deriving (Eq, Show)

data Pila = Vacio | PiM Marco Pila deriving (Eq, Show)

data State = EvalState Pila Secuencia Estado | RetState Pila Estado | ErrState Pila Estado deriving (Eq, Show)

data Secuencia = Skip
                | New String AExpr
                | Upd String AExpr
                | Seq Secuencia Secuencia
                | While BExpr Secuencia
                | If1 BExpr Secuencia
                | If2 BExpr Secuencia Secuencia
                | TryC Secuencia Secuencia
                | ErrC deriving (Eq, Show)

data AExpr = Var String
            | Num Int
            | Plus AExpr AExpr
            | Times AExpr AExpr
            | Mod AExpr AExpr
            | Div AExpr AExpr deriving (Eq, Show)

data BExpr = Bln Bool
            | And BExpr BExpr
            | Or BExpr BExpr
            | Not BExpr
            | Gt AExpr AExpr
            | Lt AExpr AExpr
            | Eq AExpr AExpr deriving (Eq, Show)