{
module While.Parser where

import Data.Char
import While.Expr
import While.Lexer

}

%name parser
%tokentype { Token }
%error { parseError }

%token
    num         { TokenNum $$ }
    var         { TokenVar $$ }
    '+'         { TokenPlus }
    '*'         { TokenTimes }
    '%'         { TokenMod }
    '/'         { TokenDiv }
    bln         { TokenBln $$ }
    and         { TokenAnd }
    or          { TokenOr }
    not         { TokenNot }
    '>'         { TokenGt }
    '<'         { TokenLt }
    '=='        { TokenEq }
    skip        { TokenSkip }
    'new'       { TokenNew }
    '='         { TokenIg }
    ':='        { TokenUpd }
    ';'         { TokenSeq }
    'while'     { TokenWhile }
    'do'        { TokenDo }
    'end'       { TokenEnd }
    'if'        { TokenIf }
    'then'      { TokenThen }
    'else'      { TokenElse }
    'try'       { TokenTry }
    'catch'     { TokenCatch }
    'error'     { TokenErr }
    '('         { TokenOB }
    ')'         { TokenCB }

%left ';'
%left 'catch'
%left else then
%left and or
%left '+'
%left '*' '/' '%'
%nonassoc '>' '<' '=='
%left not


%%

C : skip                            { Skip }
    | 'new' var '=' A               { New $2 $4 }
    | var ':=' A                    { Upd $1 $3 }
    | C ';' C                       { Seq $1 $3 }
    | 'while' B 'do' C 'end'        { While $2 $4 }
    | 'if' B 'then' C 'end'         { If1 $2 $4 }
    | 'if' B 'then' C 'else' C 'end'{ If2 $2 $4 $6 }
    | 'try' C 'catch' C             { TryC $2 $4 }
    | 'error'                       { ErrC }
    | '(' C ')'                     { $2 }

A : var                             { Var $1 }
    | num                           { Num $1 }
    | A '+' A                       { Plus $1 $3 }
    | A '*' A                       { Times $1 $3 }
    | A '%' A                       { Mod $1 $3 }
    | A '/' A                       { Div $1 $3 }
    | '(' A ')'                     { $2 }

B : bln                             { Bln $1 }
    | B and B                       { And $1 $3 }
    | B or B                        { Or $1 $3 }
    | not B                         { Not $2 }
    | A '>' A                       { Gt $1 $3 }
    | A '<' A                       { Lt $1 $3 }
    | A '==' A                      { Eq $1 $3 }
    | '(' B ')'                     { $2 }

{

main = getContents >>= print . parser . lexer

}
