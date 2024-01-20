import Logs.LogAnalysis
import Logs.Log
import Poly.Poly


mugiCheck :: Bool -> IO ()
mugiCheck a
  | a = putStrLn "Respiración de Haskell... Primera postura, Acierto en el test!"
  | otherwise = putStrLn "Mal! Donificaste a Rengoku :C"


-- Polinomios
poly_eq_t1     = P [1,2,3]                 == P [1,2,3]
poly_eq_t2     = P [1,2,3,0,0]             == P [1,2,3]
poly_show_t1   = show (P [1, 0, 0, 2])     == "2x^3 + 1"
poly_show_t2   = show (P [0, -1, 2])       == "2x^2 + -x"
poly_plus_t1   = P [5, 0, 1] + P [1, 1, 2] == P [6, 1, 3]
poly_plus_t2   = P [1, 0, 1] + P [1, 1]    == P [2, 1, 1]
poly_times_t1  = P [1, 1, 1] * P [2, 2]    == P [2, 4, 4, 2]
poly_neg_t1    = negate (P [1, 2, 3])      == P [-1, -2, -3]

-- Logs
error_result = testWhatWentWrong parse (whatWentWrongEnhanced "mustard") "Logs/error.log"
real_error_result = ["Mustardwatch opened, please close for proper functioning!",
                     "All backup mustardwatches are busy",
                     "Depletion of mustard stores detected!",
                     "Hard drive failure: insufficient mustard",
                     "All backup mustardwatches are busy",
                     "Twenty seconds remaining until out-of-mustard condition",
                     "Ten seconds remaining until out-of-mustard condition",
                     "Empty mustard reservoir! Attempting to recover..."]

main = do
    putStrLn ""
    putStrLn "Test Poly"
    mugiCheck poly_eq_t1
    mugiCheck poly_eq_t2
    mugiCheck poly_show_t1
    mugiCheck poly_show_t2
    mugiCheck poly_plus_t1
    mugiCheck poly_plus_t2
    mugiCheck poly_times_t1
    mugiCheck poly_neg_t1
    putStrLn ""
    putStrLn "Test Log Analizer"
    putStrLn ""
    putStrLn "Tu resultado:"
    putStrLn ""
    error_result
    putStrLn ""
    putStrLn ""
    putStrLn "Resultado esperado:"
    putStrLn ""
    mapM_ putStrLn real_error_result
    putStrLn ""