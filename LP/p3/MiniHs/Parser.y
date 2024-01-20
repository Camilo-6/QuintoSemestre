{
module MiniHs.Parser where
--definir parser en happy

import Data.Char
import MiniHs.Expr
import MiniHs.Lexer

}

%name parser
%tokentype { Token }
%error { parseError }

%token
    num         { TokenNum $$ }
    var         { TokenVar $$ }
    bool        { TokenBool $$ }
    '[]'        { TokenNil }
    '::'        { TokenDoubleColon }
    '++'        { TokenDoublePlus }
    'head'      { TokenHead }
    'tail'      { TokenTail }
    '+'         { TokenPlus }
    '-'         { TokenMinus }
    '*'         { TokenTimes }
    '/'         { TokenDiv }
    '%'         { TokenMod }
    '=='        { TokenEq }
    '<='        { TokenLe }
    '>='        { TokenGe }
    '<'         { TokenLt }
    '>'         { TokenGt }
    '&&'        { TokenAnd }
    '||'        { TokenOr }
    'not'       { TokenNot }
    '('         { TokenOPar }
    ')'         { TokenCPar }
    'if'        { TokenIf }
    'then'      { TokenThen }
    'else'      { TokenElse }
    'let'       { TokenLet }
    '='         { TokenEqLet }
    'in'        { TokenIn }
    'end'       { TokenEnd }
    'lam'       { TokenLamb }
    '->'        { TokenArrow }
    '['         { TokenOBrack }
    ']'         { TokenCBrack }
    'Nat'       { TokenTyNat }
    'Bool'      { TokenTyBool }

%left '->'
%left '++'
%right Con
%left '::'
%left 'let' 'in' 'end'
%left 'if' 'then' 'else'
%left '*' '/' '%'
%left '+' '-'
%left '&&' '||'
%left '==' '<' '<=' '>' '>='
%left 'not'
%left 'head' 'tail'

%%

E : var                             { Var $1 }
    | num                           { Num $1 }
    | bool                          { BoolE $1 }
    | '[]'                          { Nil }
    | E '::' E %prec Con            { Cons $1 $3 }
    | '(' E ')'                     { $2 }
    | E '+' E                       { Plus $1 $3 }
    | E '-' E                       { Minus $1 $3 }
    | E '*' E                       { Times $1 $3 }
    | E '/' E                       { Div $1 $3 }
    | E '%' E                       { Mod $1 $3 }
    | E '==' E                      { Eq $1 $3 }
    | E '<' E                       { Lt $1 $3 }
    | E '<=' E                      { Le $1 $3 }
    | E '>' E                       { Gt $1 $3 }
    | E '>=' E                      { Ge $1 $3 }
    | E '&&' E                      { And $1 $3 }
    | E '||' E                      { Or $1 $3 }
    | 'not' E                       { Not $2 }
    | 'head' E                      { Head $2 }
    | 'tail' E                      { Tail $2 }
    | E '++' E                      { Append $1 $3 }
    | '(' E E ')'                   { App $2 $3 }
    | 'if' E 'then' E 'else' E      { If $2 $4 $6 }
    | 'let' var '=' E 'in' E 'end'  { Let $2 $4 $6 }
    | 'lam' var '::' T '->' E       { Lam $2 $4 $6 }

T : 'Nat'           { Nat }
    | 'Bool'        { BooleaN }
    | T '->' T      { Arrow $1 $3 }
    | '[' T ']'     { ListOf $2 }
    | '(' T ')'     { $2 }

{

main = getContents >>= print . parser . lexer

}
