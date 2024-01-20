{
module EAB.Sintax where

import Data.Char

}

%name parser
%tokentype { Token }
%error { parseError }

%token
    '+'         { TokenPlus }
    '*'         { TokenTimes }
    'or'        { TokenOr }
    'and'       { TokenAnd }
    'not'       { TokenNot }
    '('         { TokenOpen }
    ')'         { TokenClose }
    'let'       { TokenLet }
    '='         { TokenEq }
    'in'        { TokenIn }
    'end'       { TokenEnd }
    num         { TokenNum $$ }
    bool        { TokenBool $$ }
    var         { TokenVar $$ }

%right 'in'
%right '='
%left '*' '+'
%left 'not' 'and' 'or'

%%

EAB : EAB '+' EAB       { Plus $1 $3 }
    | EAB '*' EAB       { Times $1 $3 }
    | EAB 'or' EAB      { Or $1 $3 }
    | EAB 'and' EAB     { And $1 $3 }
    | 'not' EAB         { Not $2 }
    | '(' EAB ')'       { Brack $2 }
    | 'let' var '=' EAB 'in' EAB 'end' { Let $2 $4 $6 }
    | num               { Num $1 }
    | bool              { Bool $1 }
    | var               { Var $1 }

{
parseError :: [Token] -> a
parseError _ = error "Parse error"

data Token = TokenPlus
    | TokenTimes
    | TokenOr
    | TokenAnd
    | TokenNot
    | TokenOpen
    | TokenClose
    | TokenLet
    | TokenEq
    | TokenIn
    | TokenEnd
    | TokenNum Int
    | TokenBool Bool
    | TokenVar String
    deriving Show

data EAB = Plus EAB EAB
    | Times EAB EAB
    | Or EAB EAB
    | And EAB EAB
    | Not EAB
    | Brack EAB
    | Let String EAB EAB
    | Num Int
    | Bool Bool
    | Var String
    deriving Show

lexer :: String -> [Token]
lexer [] = []
lexer (c:cs)
        | isSpace c = lexer cs
        | isAlpha c = lexVar (c:cs)
        | isDigit c = lexNum (c:cs)
lexer ('+':cs) = TokenPlus : lexer cs
lexer ('*':cs) = TokenTimes : lexer cs
lexer ('(':cs) = TokenOpen : lexer cs
lexer (')':cs) = TokenClose : lexer cs
lexer ('=':cs) = TokenEq : lexer cs

lexNum :: String -> [Token]
lexNum cs = TokenNum (read num) : lexer rest
    where (num,rest) = span isDigit cs

lexVar :: String -> [Token]
lexVar cs =
    case span isAlpha cs of
        ("let",rest) -> TokenLet : lexer rest
        ("in",rest) -> TokenIn : lexer rest
        ("end",rest) -> TokenEnd : lexer rest
        ("true",rest) -> TokenBool True : lexer rest
        ("false",rest) -> TokenBool False : lexer rest
        ("not",rest) -> TokenNot : lexer rest
        ("and",rest) -> TokenAnd : lexer rest
        ("or",rest) -> TokenOr : lexer rest
        (var,rest) -> TokenVar var : lexer rest

main = getContents >>= print . parser . lexer

}
