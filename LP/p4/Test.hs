module Test where
import While.Lexer ( lexer )
import While.Parser ( parser )
import While.Expr ( State(EvalState), Pila(Vacio) )
import Data.Map ( fromList, empty )
import While.Expr (Estado)
import While.Eval (eval, evalN)
import While.Expr (Secuencia)


mugiCheck :: IO Bool  -> IO ()
mugiCheck a = do a <- a;
                 if a
                 then putStrLn "Respiracion de Haskell... Primera postura, Acierto en el test!"
                 else putStrLn  "Mal! Donificaste a Rengoku :C"

test_parser :: FilePath -> IO Secuencia
test_parser file = parser . lexer <$> readFile file


secToSt :: IO Secuencia -> IO State
secToSt s = (\s -> EvalState Vacio s empty) <$> s

-- Programa sencillo
pgm1 :: IO Secuencia
pgm1 = test_parser "MyPgms/pgm.w"
exp1 :: Estado
exp1 = fromList [("x",5),("y",70),("z",350)]

-- Programa para calcular el factorial de 5
pgm2 :: IO Secuencia
pgm2 = test_parser "MyPgms/factorial.w"
exp2 :: Estado
exp2 = fromList [("acc",5),("fact",120),("objetive",5)]

-- Programa sencillo con manejo de errores
pgm3 :: IO Secuencia
pgm3 = test_parser "MyPgms/try.w"
exp3 :: Estado
exp3 = fromList [("prod",0),("x",1),("y",6)]

-- Programa donde manejamos el error de un factorial de cero, haciendo calcular fact de 25 (iba a ser un numero enorme,
-- pero los ints de haskell no son suficientemente poderosos jeje)
pgm4 :: IO Secuencia
pgm4 = test_parser "MyPgms/factTrol.w"
exp4 :: Estado
exp4 = fromList [("acc",14),("fact",87178291200),("objetive",14)]

-- Programa random
pgm5 :: IO Secuencia
pgm5 = test_parser "MyPgms/random.w"
exp5 :: Estado
exp5 = fromList [("x",5),("y",625),("z",1)]

t1 = (== exp1) . eval <$> pgm1
t2 = (== exp2) . eval <$> pgm2
t3 = (== exp3) . eval <$> pgm3
t4 = (== exp4) . eval <$> pgm4
t5 = (== exp5) . eval <$> pgm5

main = do
    putStr "T1: "
    mugiCheck t1
    putStr "T2: "
    mugiCheck t2
    putStr "T3: "
    mugiCheck t3
    putStr "T4: "
    mugiCheck t4
    putStr "T5: "
    mugiCheck t5
    