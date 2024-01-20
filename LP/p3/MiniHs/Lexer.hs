module MiniHs.Lexer where
-- definir lexer, token, etc

import Data.Char

data Token = TokenNum Int
            | TokenVar String
            | TokenBool Bool
            | TokenNil
            | TokenDoubleColon
            | TokenDoublePlus
            | TokenHead
            | TokenTail
            | TokenPlus
            | TokenMinus
            | TokenTimes
            | TokenDiv
            | TokenMod
            | TokenEq
            | TokenLt
            | TokenGt
            | TokenLe
            | TokenGe
            | TokenAnd
            | TokenOr
            | TokenNot
            | TokenOPar
            | TokenCPar
            | TokenIf
            | TokenThen
            | TokenElse
            | TokenLet
            | TokenEqLet
            | TokenIn
            | TokenEnd
            | TokenLamb
            | TokenArrow
            | TokenOBrack
            | TokenCBrack
            | TokenTyNat
            | TokenTyBool
            deriving Show

parseError :: [Token] -> a
parseError tokens = error $ "Parse error on tokens: " ++ show tokens

lexer :: String -> [Token]
lexer [] = []
lexer (c:cs)
    | isSpace c = lexer cs
    | isDigit c = lexNum (c:cs)
    | isAlpha c = lexVar (c:cs)
lexer ('[':']':cs) = TokenNil : lexer cs
lexer (':':':':cs) = TokenDoubleColon : lexer cs
lexer ('+':'+':cs) = TokenDoublePlus : lexer cs
lexer ('+':cs) = TokenPlus : lexer cs
lexer ('-':'>':cs) = TokenArrow : lexer cs
lexer ('-':cs) = TokenMinus : lexer cs
lexer ('*':cs) = TokenTimes : lexer cs
lexer ('/':cs) = TokenDiv : lexer cs
lexer ('%':cs) = TokenMod : lexer cs
lexer ('=':'=':cs) = TokenEq : lexer cs
lexer ('<':'=':cs) = TokenLe : lexer cs
lexer ('>':'=':cs) = TokenGe : lexer cs
lexer ('<':cs) = TokenLt : lexer cs
lexer ('>':cs) = TokenGt : lexer cs
lexer ('&':'&':cs) = TokenAnd : lexer cs
lexer ('|':'|':cs) = TokenOr : lexer cs
lexer ('(':cs) = TokenOPar : lexer cs
lexer (')':cs) = TokenCPar : lexer cs
lexer ('=':cs) = TokenEqLet : lexer cs
lexer ('[':cs) = TokenOBrack : lexer cs
lexer (']':cs) = TokenCBrack : lexer cs
lexer _ = parseError []

lexNum :: String -> [Token]
lexNum cs = TokenNum (read num) : lexer rest
    where (num,rest) = span isDigit cs

lexVar :: String -> [Token]
lexVar cs =
    case span isAlpha cs of
        ("True",rest) -> TokenBool True : lexer rest
        ("False",rest) -> TokenBool False : lexer rest
        ("head",rest) -> TokenHead : lexer rest
        ("tail",rest) -> TokenTail : lexer rest
        ("not",rest) -> TokenNot : lexer rest
        ("if",rest) -> TokenIf : lexer rest
        ("then",rest) -> TokenThen : lexer rest
        ("else",rest) -> TokenElse : lexer rest
        ("let",rest) -> TokenLet : lexer rest
        ("in",rest) -> TokenIn : lexer rest
        ("end",rest) -> TokenEnd : lexer rest
        ("lam",rest) -> TokenLamb : lexer rest
        ("Nat",rest) -> TokenTyNat : lexer rest
        ("Bool",rest) -> TokenTyBool : lexer rest
        (var,rest) -> TokenVar var : lexer rest