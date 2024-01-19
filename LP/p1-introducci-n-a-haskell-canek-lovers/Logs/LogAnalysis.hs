module Logs.LogAnalysis where
import Logs.Log
import Data.List
import Data.Char

{-|
Method to check if a string is a long message and return a maybe long message
-}
parseMessage :: String -> MaybeLogMessage
parseMessage "" = InvalidLM ""
parseMessage text | head text == 'I' = auxParseMessage (splitString text) text
                  | head text == 'W' = auxParseMessage (splitString text) text
                  | head text == 'E' = auxParseMessageE (splitStringE text) text
                  | otherwise = InvalidLM text

{-|
Method to filter all the long messages from a list of maybe long messages
-}
validMessagesOnly :: [MaybeLogMessage] -> [LogMessage]
validMessagesOnly [] = []
validMessagesOnly (x:xs) = case x of
    ValidLM val -> val : validMessagesOnly xs
    _ -> validMessagesOnly xs

{-|
Method to parse a string to a list of log messages
-}
parse :: String -> [LogMessage]
parse "" = []
parse text = validMessagesOnly (map parseMessage (lines text))

{-|
Method to compare two log messages
-}
compareMsgs :: LogMessage -> LogMessage -> Ordering
compareMsgs (LogMessage _ t1 _) (LogMessage _ t2 _) = compare t1 t2

{-|
Method to sort a list of log messages
-}
sortMessages :: [LogMessage] -> [LogMessage]
sortMessages [] = []
sortMessages list = sortBy compareMsgs list

{-|
Method to get a list of the error long messages with a severity of 50 or more
-}
whatWentWrong :: [LogMessage] -> [String]
whatWentWrong [] = []
whatWentWrong list = auxWhatWentWrong (sortMessages list)

{-|
Method to get a list of the long messages that contains a word
-}
messagesAbout :: String -> [LogMessage] -> [LogMessage]
messagesAbout _ [] = []
messagesAbout word (x:xs) = case x of
    LogMessage _ _ msg -> if isInfixOf word2 (map toLower msg) then x : messagesAbout word xs else messagesAbout word xs
    _ -> messagesAbout word xs
    where
        word2 = map toLower word

{-|
Method to get a list of the error long messages with a severity of 50 or more and the long messages that contains a word
-}
whatWentWrongEnhanced :: String -> [LogMessage] -> [String]
whatWentWrongEnhanced _ [] = []
whatWentWrongEnhanced word list = auxWhatWentWrong (sortMessages (messagesAbout word list))

{-|
Method to split a string into a list of strings
-}
splitString :: String -> [String]
splitString text = first ++ [unwords rest] where
    (first, rest) = splitAt 2 (words text)

{-|
Method to split a string into a list of strings
-}
splitStringE :: String -> [String]
splitStringE text = first ++ [unwords rest] where
    (first, rest) = splitAt 3 (words text)

{-|
Method to turn a list of strings into a maybe long message
-}
auxParseMessage :: [String] -> String -> MaybeLogMessage
auxParseMessage a b =
    if length a /= 3 then
        InvalidLM b
    else if (readInt (a !! 1)) == InvalidInt then
        InvalidLM b
    else if (head (a !! 0)) == 'I' then
        ValidLM (LogMessage Info i (a !! 2))
    else if (head (a !! 0)) == 'W' then
        ValidLM (LogMessage Warning i (a !! 2))
    else InvalidLM b
    where
        i = case readInt (a !! 1) of
            ValidInt val -> val
            _ -> error "Invalid integer"

{-|
Method to turn a list of strings into a maybe long message
-}
auxParseMessageE :: [String] -> String -> MaybeLogMessage
auxParseMessageE a b =
    if length a /= 4 then
        InvalidLM b
    else if (readInt (a !! 1)) == InvalidInt then
        InvalidLM b
    else if (readInt (a !! 2)) == InvalidInt then
        InvalidLM b
    else if (head (a !! 0)) == 'E' then
        ValidLM (LogMessage (Error i) j (a !! 3))
    else InvalidLM b
    where
        i = case readInt (a !! 1) of
            ValidInt val -> val
            _ -> error "Invalid integer"
        j = case readInt (a !! 2) of
            ValidInt val -> val
            _ -> error "Invalid integer"

{-|
Method to get the message of a maybe long message with a severity of 50 or more
-}
auxWhatWentWrong :: [LogMessage] -> [String]
auxWhatWentWrong [] = []
auxWhatWentWrong (x:xs) = case x of
    LogMessage (Error i) _ msg -> if i >= 50 then msg : auxWhatWentWrong xs else auxWhatWentWrong xs
    _ -> auxWhatWentWrong xs