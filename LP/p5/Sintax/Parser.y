{
module Sintax.Parser where
import Sintax.Lexer
import Sintax.Expr
import Semantic.Static.Type
import Data.Map
}

%name parser
%tokentype { Token }
%error { parseError }

%token 
      num                  { TokenInt $$ }
      float                { TokenFloat $$ }
      var                  { TokenVar $$ }
      bool                 { TokenBool $$ } 
      '('                  { TokenOB }
      ')'                  { TokenCB }
      '+'                  { TokenPlus }
      '-'                  { TokenMinus }
      '*'                  { TokenTimes }
      '/'                  { TokenDiv }
      '%'                  { TokenMod }
      '=='                 { TokenEq }
      '>'                  { TokenGt }
      '<'                  { TokenLt }
      '>='                 { TokenGeq }
      '<='                 { TokenLeq }
      '&&'                 { TokenAnd }
      '||'                 { TokenOr }
      not                  { TokenNot }
      if                   { TokenIf }
      then                 { TokenThen }
      else                 { TokenElse }
      let                  { TokenLet }
      '='                  { TokenAssign }
      in                   { TokenIn }
      end                  { TokenEnd }
      lam                  { TokenLam }
      '->'                 { TokenArrow }
      ':'                  { TokenTypeOf }
      '{'                  { TokenOK }
      '}'                  { TokenCK }
      ','                  { TokenComma }
      '['                  { TokenOC }
      ']'                  { TokenCC }
      fst                  { TokenFst }
      snd                  { TokenSnd }
      inr                  { TokenInr }
      inl                  { TokenInL }
      '_'                  { TokenUnderS }
      case                 { TokenCase }
      of                   { TokenOf }
      '=>'                 { TokenBigArrow }
      '|'                  { TokenPipe }
      Int                  { TokenTInt }
      Float                { TokenTFloat }
      Bool                 { TokenTBool }
      pot                  { TokenPot }
      sqrt                 { TokenSqrt }

%left else
%right '->'
%left '||'
%left '&&'
%nonassoc '==' '>' '<' '>=' '<='
%left '+' '-'
%left '*' '/' '%'
%left not NEG fst snd pot sqrt
%left '['

%%

E    : num                         { Int $1 }
     | bool                        { Bool $1 }
     | var                         { Var $1 }
     | float                       { Float $1 }

     | E '+' E                     { BinaryOp (ArithOp Plus) $1 $3 } 
     | E '-' E                     { BinaryOp (ArithOp Minus) $1 $3 }
     | E '*' E                     { BinaryOp (ArithOp Times) $1 $3 }
     | E '/' E                     { BinaryOp (ArithOp Div) $1 $3 }
     | E '%' E                     { BinaryOp (ArithOp Mod) $1 $3 }
     | E '==' E                    { BinaryOp (CompOp Eq) $1 $3 }
     | E '>' E                     { BinaryOp (CompOp Gt) $1 $3 }
     | E '<' E                     { BinaryOp (CompOp Lt) $1 $3 }
     | E '>=' E                    { BinaryOp (CompOp Geq) $1 $3 }
     | E '<=' E                    { BinaryOp (CompOp Leq) $1 $3 }
     | E '&&' E                    { BinaryOp (LogicalOp And) $1 $3 }
     | E '||' E                    { BinaryOp (LogicalOp Or) $1 $3 }

     | not E                       { UnaryOp Not $2 }
     | '-' E %prec NEG             { UnaryOp Negate $2 }
     | pot E                       { UnaryOp Pot $2 }
     | sqrt E                      { UnaryOp Sqrt $2 }
     
     | '(' E ')'                   { $2 }
     | '(' E E ')'                 { App $2 $3 }
     | if E then E else E          { If $2 $4 $6 }
     | let var '=' E in E end      { Let $2 $4 $6 }
     | lam '(' var ':' T ')' ':' T '->' E  { Lambda $3 $5 $8 $10 }

     | '('E ',' E')'               { Pair $2 $4 }
     | fst E                       { Fst $2 }
     | snd E                       { Snd $2 }

     | inl'_'T'('E')'              { Inl $3 $5 }
     | inr'_'T'('E')'              { Inr $3 $5 }
     | case E of '{'inl var '=>' E '|' inr var '=>' E'}'    { Case $2 $6 $8 $11 $13 }
     
     | '{' reglist '}'             { Record $2 }
     | E'[' var ']'                { Prj $3 $1 }

reglist : reg                      { [$1] }
        | reglist ',' reg          { $3 : $1 }
reg     : var '=' E                { ($1 , $3) }
reglistT : regT                    { [$1] }
         | reglistT ',' regT       { $3 : $1 }
regT     :  var ':' T              { ($1 , $3) }

T    : Bool                { TBool }
     | Int                 { TInt }
     | Float               { TFloat }
     | T '->' T            { TFunc $1 $3 }
     | T '*' T             { TProd $1 $3 }
     | T '+' T             { TSum $1 $3 }
     | '{' reglistT '}'    { TRecord $2 }
     | '(' T ')'           { $2 }
{
parseError :: [Token] -> a
parseError ts = error ("Parse error" ++ (show ts))
}