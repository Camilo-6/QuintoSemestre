module Test where
import Sintax.Expr ( Expr(Float, Int, Inr, Bool) )
import Semantic.Dynamic.Inter ( evalStep, eval )
import Semantic.Static.Type ( Type(TFloat, TSum, TInt, TBool) )
import Semantic.Static.Vt ( vt )
import Sintax.Parser (parser)
import Sintax.Lexer (lexer)

mugiCheck :: IO Bool  -> IO ()
mugiCheck a = do a <- a;
                 if a
                 then putStrLn "Respiracion de Haskell... Primera postura, Acierto en el test!"
                 else putStrLn  "Mal! Donificaste a Rengoku :C"

stepN :: Int -> IO Expr -> IO Expr
stepN n e = if n == 0
            then e
            else stepN  (n-1) (evalStep <$> e)

test_parser :: FilePath -> IO Expr
test_parser file = parser . lexer <$> readFile file

execute :: Expr -> (Expr, Type)
execute e = let t = vt [] e
                v = eval e
            in (v, t)

checkExecute :: IO (Expr, Type) -> Expr -> Type -> IO Bool
checkExecute r e t = (\et -> fst et == e && snd et == t) <$> r

pgm1 :: IO Expr
pgm1 = test_parser "pgm/simple_fun.sub"
pgm2 :: IO Expr
pgm2 = test_parser "pgm/fact_tail.sub"
pgm3 :: IO Expr
pgm3 = test_parser "pgm/distance.sub"
pgm4 :: IO Expr
pgm4 = test_parser "pgm/grade.sub"
pgm5 :: IO Expr
pgm5 = test_parser "pgm/eval.sub"

test_s1 :: IO Bool
test_s1 = checkExecute (execute <$> pgm1) (Float 8.5) TFloat
test_s2 :: IO Bool
test_s2 = checkExecute (execute <$> pgm2) (Int 720) TInt
test_s3 :: IO Bool
test_s3 = checkExecute (execute <$> pgm3) (Float 6.4226162893) TFloat
test_s4 :: IO Bool
test_s4 = checkExecute (execute <$> pgm4) (Inr TInt (Bool False)) (TSum TInt TBool)
test_s5 :: IO Bool
test_s5 = checkExecute (execute <$> pgm5) (Int 50) TFloat

main = do
    putStrLn " ======== Test ======== "
    putStr "Subtipado simple: "
    mugiCheck test_s1
    putStr "Tipos producto: "
    mugiCheck test_s2
    putStr "Registros: "
    mugiCheck test_s3
    putStr "Tipos suma simple: "
    mugiCheck test_s4
    putStr "Tipos suma con case: "
    mugiCheck test_s5