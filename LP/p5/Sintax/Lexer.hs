module Sintax.Lexer where
import Data.Char ( isAlpha, isDigit, isSpace )

data Token
      -- Valores
      = TokenInt Int
      | TokenFloat Float
      | TokenVar String 
      | TokenBool Bool 
      -- Parentesis
      | TokenOB 
      | TokenCB 
      -- Operadores
      | TokenPlus 
      | TokenMinus 
      | TokenTimes 
      | TokenDiv 
      | TokenMod 
      | TokenEq 
      | TokenGt 
      | TokenLt 
      | TokenGeq 
      | TokenLeq 
      | TokenAnd 
      | TokenOr 
      | TokenNot 
      -- If
      | TokenIf 
      | TokenThen 
      | TokenElse 
      -- Asignaciones locales
      | TokenLet 
      | TokenAssign 
      | TokenIn 
      | TokenEnd 
      -- Funciones
      | TokenLam 
      | TokenArrow 
      | TokenTypeOf 
      -- Registros
      | TokenOK --{
      | TokenCK --}
      | TokenComma 
      | TokenOC --[
      | TokenCC --]
      -- Producto
      | TokenFst
      | TokenSnd
      -- Suma
      | TokenInr 
      | TokenInL 
      | TokenUnderS 
      | TokenCase 
      | TokenOf 
      | TokenBigArrow 
      | TokenPipe 
      -- Tipos
      | TokenTNat 
      | TokenTInt 
      | TokenTFloat 
      | TokenTBool
      -- Potencia y raiz
      | TokenPot
      | TokenSqrt
      -- Error
      | Error Char
      deriving Show

lexer :: String -> [Token]
lexer [] = []
lexer (c:cs) 
      | isSpace c = lexer cs
      | isDigit c = lexNum (c:cs)
      | isAlpha c = lexVar (c:cs)
lexer ('-':'>':cs) = TokenArrow : lexer cs
lexer ('=':'>':cs) = TokenBigArrow : lexer cs

lexer ('+':cs) = TokenPlus : lexer cs
lexer ('-':cs) = TokenMinus : lexer cs
lexer ('*':cs) = TokenTimes : lexer cs
lexer ('/':cs) = TokenDiv : lexer cs
lexer ('%':cs) = TokenMod : lexer cs
lexer ('&':'&':cs) = TokenAnd : lexer cs
lexer ('|':'|':cs) = TokenOr : lexer cs
lexer ('=':'=':cs) = TokenEq : lexer cs
lexer ('>':'=':cs) = TokenGeq : lexer cs
lexer ('<':'=':cs) = TokenLeq : lexer cs
lexer ('>':cs) = TokenGt : lexer cs
lexer ('<':cs) = TokenLt : lexer cs

lexer ('=':cs) = TokenAssign : lexer cs
lexer (':':cs) = TokenTypeOf : lexer cs
lexer ('_':cs) = TokenUnderS : lexer cs
lexer (',':cs) = TokenComma : lexer cs
lexer ('|':cs) = TokenPipe : lexer cs
lexer ('(':cs) = TokenOB : lexer cs
lexer (')':cs) = TokenCB : lexer cs
lexer ('[':cs) = TokenOC : lexer cs
lexer (']':cs) = TokenCC : lexer cs
lexer ('{':cs) = TokenOK : lexer cs
lexer ('}':cs) = TokenCK : lexer cs

lexer (x:cs) = Error x : lexer cs

lexNum :: [Char] -> [Token]
lexNum cs = let (num,rest) = span isDigit cs
            in case rest of
                  ('.':rest') -> lexFloat (num,rest')
                  rest' -> TokenInt (read num) : lexer rest
      
lexFloat :: ([Char],[Char]) -> [Token]
lexFloat (num,cs) = TokenFloat (read float) : lexer rest
                      where (frac, rest) = span isDigit cs
                            float = num ++ ('.': frac)

lexVar :: [Char] -> [Token]
lexVar cs = case span isAlpha cs of
      ("if",cs') -> TokenIf : lexer cs'
      ("then",cs') -> TokenThen : lexer cs'
      ("else",cs') -> TokenElse : lexer cs'
      ("let",cs') -> TokenLet : lexer cs'
      ("in",cs') -> TokenIn : lexer cs'
      ("end",cs') -> TokenEnd : lexer cs'
      ("lam",cs') -> TokenLam : lexer cs'

      ("fst",cs') -> TokenFst : lexer cs'
      ("snd",cs') -> TokenSnd : lexer cs'

      ("inr",cs') -> TokenInr : lexer cs'
      ("inl",cs') -> TokenInL : lexer cs'
      ("case",cs') -> TokenCase : lexer cs'
      ("of",cs') -> TokenOf : lexer cs'

      ("pot",cs') -> TokenPot : lexer cs'
      ("sqrt", cs') -> TokenSqrt : lexer cs'
      
      ("True",cs') -> TokenBool True: lexer cs'
      ("False",cs') -> TokenBool False : lexer cs'
      ("not",cs') -> TokenNot : lexer cs'

      ("Nat",cs') -> TokenTNat : lexer cs'
      ("Bool",cs') -> TokenTBool : lexer cs'
      ("Int",cs') -> TokenTInt : lexer cs'
      ("Float",cs') -> TokenTFloat : lexer cs'
      (var,cs') -> TokenVar var : lexer cs'