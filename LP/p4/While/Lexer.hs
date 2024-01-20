module While.Lexer where

import Data.Char

data Token = TokenNum Int
            | TokenVar String
            | TokenPlus
            | TokenTimes
            | TokenMod
            | TokenDiv
            | TokenBln Bool
            | TokenAnd
            | TokenOr
            | TokenNot
            | TokenGt
            | TokenLt
            | TokenEq
            | TokenSkip
            | TokenNew
            | TokenIg
            | TokenUpd
            | TokenSeq
            | TokenWhile
            | TokenDo
            | TokenEnd
            | TokenIf
            | TokenThen
            | TokenElse
            | TokenTry
            | TokenCatch
            | TokenErr
            | TokenOB
            | TokenCB
            deriving Show

parseError :: [Token] -> a
parseError tokens = error $ "Parse error on tokens: " ++ show tokens

lexer :: String -> [Token]
lexer [] = []
lexer (c:cs)
    | isSpace c = lexer cs
    | isDigit c = lexNum (c:cs)
    | isAlpha c = lexVar (c:cs)
lexer ('+':cs) = TokenPlus : lexer cs
lexer ('*':cs) = TokenTimes : lexer cs
lexer ('%':cs) = TokenMod : lexer cs
lexer ('/':cs) = TokenDiv : lexer cs
lexer ('>':cs) = TokenGt : lexer cs
lexer ('<':cs) = TokenLt : lexer cs
lexer ('=':'=':cs) = TokenEq : lexer cs
lexer ('=':cs) = TokenIg : lexer cs
lexer (':':'=':cs) = TokenUpd : lexer cs
lexer (';':cs) = TokenSeq : lexer cs
lexer ('(':cs) = TokenOB : lexer cs
lexer (')':cs) = TokenCB : lexer cs
lexer _ = parseError []

lexNum :: String -> [Token]
lexNum cs = TokenNum (read num) : lexer rest
    where (num,rest) = span isDigit cs

lexVar :: String -> [Token]
lexVar cs =
    case span isAlpha cs of
        ("true",rest) -> TokenBln True : lexer rest
        ("false",rest) -> TokenBln False : lexer rest
        ("and",rest) -> TokenAnd : lexer rest
        ("or",rest) -> TokenOr : lexer rest
        ("not",rest) -> TokenNot : lexer rest
        ("skip",rest) -> TokenSkip : lexer rest
        ("new",rest) -> TokenNew : lexer rest
        ("while",rest) -> TokenWhile : lexer rest
        ("do",rest) -> TokenDo : lexer rest
        ("end",rest) -> TokenEnd : lexer rest
        ("if",rest) -> TokenIf : lexer rest
        ("then",rest) -> TokenThen : lexer rest
        ("else",rest) -> TokenElse : lexer rest
        ("try",rest) -> TokenTry : lexer rest
        ("catch",rest) -> TokenCatch : lexer rest
        ("error",rest) -> TokenErr : lexer rest
        (var,rest) -> TokenVar var : lexer rest
        