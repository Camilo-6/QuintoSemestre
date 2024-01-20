module Semantic.Static.Sub where
import Semantic.Static.Type
import Data.List

sub :: Type -> Type -> Bool
sub t1 t2 | t1 == t2 = True
sub TNat TInt = True
sub TInt TFloat = True
sub (TFunc s1 s2) (TFunc t1 t2) = sub t1 s1 && sub s2 t2
sub (TSum s1 s2) (TSum t1 t2) = sub s1 t1 && sub s2 t2
sub (TProd s1 s2) (TProd t1 t2) = sub s1 t1 && sub s2 t2
sub (TRecord sFields) (TRecord tFields) =
    length sFields >= length tFields &&
    all (\(sLabel, sType) -> any (\(tLabel, tType) -> sLabel == tLabel && sub sType tType) tFields) sFields
sub _ _ = False



