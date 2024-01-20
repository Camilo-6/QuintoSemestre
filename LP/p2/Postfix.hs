module Postfix where

import Data.Char

data Token = Postfix | Add | Div | Eq | Gt | Lt | Mul | Nget | Pop | Rem | Sel | Sub | Swap | Number Int deriving Show

data Pgm = Pgm Int Command deriving Show

data Command = NumberCommand Int Command | AddCommand Command | DivCommand Command | EqCommand Command | GtCommand Command | LtCommand Command | MulCommand Command | NgetCommand Command | PopCommand Command | RemCommand Command | SelCommand Command | SubCommand Command | SwapCommand Command | EmptyCommand deriving Show

{-|
Method to carry out the process of lexical analysis from a valid string from 
the language and returning the resulting list of tokens.
-}
lexer :: String -> [Token]
lexer [] = []
lexer (x:xs)
  | isSpace x = lexer xs
  | isDigit x || (x == '-' && not (null xs) && isDigit (head xs)) = lexNum (x:xs)
  | isAlpha x = lexVar (x:xs)
lexer _ = error "Lex error"

{-|
Method to get the number from a string of characters and return the resulting.
-}
lexNum :: String -> [Token]
lexNum xs = Number (read num) : lexer rest
  where (num, rest) = span (\c -> isDigit c || c == '-') xs

{-|
Method to get the variable from a string of characters and return the resulting.
-}
lexVar :: String -> [Token]
lexVar [] = []
lexVar xs =
  case span isAlpha xs of
    ("postfix", rest) -> Postfix : lexer rest
    ("add", rest) -> Add : lexer rest
    ("div", rest) -> Div : lexer rest
    ("eq", rest) -> Eq : lexer rest
    ("gt", rest) -> Gt : lexer rest
    ("lt", rest) -> Lt : lexer rest
    ("mul", rest) -> Mul : lexer rest
    ("nget", rest) -> Nget : lexer rest
    ("pop", rest) -> Pop : lexer rest
    ("rem", rest) -> Rem : lexer rest
    ("sel", rest) -> Sel : lexer rest
    ("sub", rest) -> Sub : lexer rest
    ("swap", rest) -> Swap : lexer rest
    _ -> error "Lex error"

{-|
Method to return the abstract syntax tree corresponding from a list of tokens 
resulting from lexical analysis.
-}
parser :: [Token] -> Pgm
parser [] = parserError []
parser (Postfix:xs) = Pgm (parserNumber (head xs)) (parserCommand (tail xs))
parser _ = parserError []

{-|
Method to return an error message when the parser fails.
-}
parserError :: [Token] -> a
parserError _ = error "Parse error"

{-|
Method to get the number from a token and return the resulting.
-}
parserNumber :: Token -> Int
parserNumber (Number n) = n
parserNumber _ = parserError []

{-|
Method to return the abstract syntax tree corresponding from a list of tokens
resulting from lexical analysis.
-}
parserCommand :: [Token] -> Command
parserCommand [] = EmptyCommand
parserCommand (Add:xs) = AddCommand (parserCommand xs)
parserCommand (Div:xs) = DivCommand (parserCommand xs)
parserCommand (Eq:xs) = EqCommand (parserCommand xs)
parserCommand (Gt:xs) = GtCommand (parserCommand xs)
parserCommand (Lt:xs) = LtCommand (parserCommand xs)
parserCommand (Mul:xs) = MulCommand (parserCommand xs)
parserCommand (Nget:xs) = NgetCommand (parserCommand xs)
parserCommand (Pop:xs) = PopCommand (parserCommand xs)
parserCommand (Rem:xs) = RemCommand (parserCommand xs)
parserCommand (Sel:xs) = SelCommand (parserCommand xs)
parserCommand (Sub:xs) = SubCommand (parserCommand xs)
parserCommand (Swap:xs) = SwapCommand (parserCommand xs)
parserCommand (Number n:xs) = NumberCommand n (parserCommand xs)
parserCommand _ = parserError []

data Stack a = Mt | Top a (Stack a) deriving Show

{-|
Method to create an empty stack.
-}
emptyStack :: Stack a
emptyStack = Mt

{-|
Method to add an element to the stack.
-}
push :: a -> Stack a -> Stack a
push x s = Top x s

{-|
Method to get the element at the top of the stack.
-}
peek :: Stack a -> Maybe a
peek Mt = Nothing
peek (Top x _) = Just x

{-|
Method to get the i element from the top of the stack.
-}
peek2 :: Stack a -> Int -> Maybe a
peek2 Mt _ = Nothing
peek2 (Top x _) 1 = Just x
peek2 (Top _ xs) n = peek2 xs (n - 1)

{-|
Method to remove the element at the top of the stack.
-}
pop :: Stack a -> Maybe (Stack a, a)
pop Mt = Nothing
pop (Top x xs) = Just (xs, x)

{-|
Method to check if the stack is empty.
-}
isEmpty :: Stack a -> Bool
isEmpty Mt = True
isEmpty _ = False

{-|
Method to get the size of the stack.
-}
size :: Stack a -> Int
size Mt = 0
size (Top _ xs) = 1 + size xs

{-|
Method to implement the interpreter for the PostFix language.
-}
eval :: Stack Int -> Pgm -> Int
eval s (Pgm n c) = if n == size s then evalCommand s c else error "Stack size error"

{-|
Method to evaluate the command and return the resulting.
-}
evalCommand :: Stack Int -> Command -> Int
evalCommand s EmptyCommand = case pop s of
  Just (_, x) -> x
  Nothing -> error "Stack size error"
evalCommand s (NumberCommand n c) = evalCommand (push n s) c
evalCommand s (AddCommand c) = case pop s of
  Just (s', x) -> case pop s' of
    Just (s'', y) -> evalCommand (push (x + y) s'') c
    Nothing -> error "Stack size error"
  Nothing -> error "Stack size error"
evalCommand s (DivCommand c) = case pop s of
  Just (s', x) -> case pop s' of
    Just (s'', y) -> evalCommand (push (y `div` x) s'') c
    Nothing -> error "Stack size error"
  Nothing -> error "Stack size error"
evalCommand s (EqCommand c) = case pop s of
  Just (s', x) -> case pop s' of
    Just (s'', y) -> evalCommand (push (if y == x then 1 else 0) s'') c
    Nothing -> error "Stack size error"
  Nothing -> error "Stack size error"
evalCommand s (GtCommand c) = case pop s of
  Just (s', x) -> case pop s' of
    Just (s'', y) -> evalCommand (push (if y > x then 1 else 0) s'') c
    Nothing -> error "Stack size error"
  Nothing -> error "Stack size error"
evalCommand s (LtCommand c) = case pop s of
  Just (s', x) -> case pop s' of
    Just (s'', y) -> evalCommand (push (if y < x then 1 else 0) s'') c
    Nothing -> error "Stack size error"
  Nothing -> error "Stack size error"
evalCommand s (MulCommand c) = case pop s of
  Just (s', x) -> case pop s' of
    Just (s'', y) -> evalCommand (push (x * y) s'') c
    Nothing -> error "Stack size error"
  Nothing -> error "Stack size error"
evalCommand s (NgetCommand c) = case pop s of
  Just (s', x) -> if (x < 1 || x > size s') then evalCommand s' c
    else case peek2 s' x of
      Just y -> evalCommand (push y s') c
      Nothing -> error "Stack size error"
  Nothing -> error "Stack size error"
evalCommand s (PopCommand c) = case pop s of
  Just (s', _) -> evalCommand s' c
  Nothing -> error "Stack size error"
evalCommand s (RemCommand c) = case pop s of
  Just (s', x) -> case pop s' of
    Just (s'', y) -> evalCommand (push (y `mod` x) s'') c
    Nothing -> error "Stack size error"
  Nothing -> error "Stack size error"
evalCommand s (SelCommand c) = case pop s of
  Just (s', x) -> case pop s' of
    Just (s'', y) -> case pop s'' of
      Just (s''', z) -> evalCommand (push (if z == 0 then x else y) s''') c
      Nothing -> error "Stack size error"
    Nothing -> error "Stack size error"
  Nothing -> error "Stack size error"
evalCommand s (SubCommand c) = case pop s of
  Just (s', x) -> case pop s' of
    Just (s'', y) -> evalCommand (push (y - x) s'') c
    Nothing -> error "Stack size error"
  Nothing -> error "Stack size error"
evalCommand s (SwapCommand c) = case pop s of
  Just (s', x) -> case pop s' of
    Just (s'', y) -> evalCommand (push y (push x s'')) c
    Nothing -> error "Stack size error"
  Nothing -> error "Stack size error"