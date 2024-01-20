module Semantic.Static.Type where
import Data.Map

data Type
  = TBool
  | TNat
  | TInt
  | TFloat
  | TFunc Type Type
  | TProd Type Type
  | TSum Type Type
  | TRecord [(String, Type)]
  deriving (Show,Eq)