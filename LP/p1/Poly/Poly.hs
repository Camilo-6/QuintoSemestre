module Poly.Poly where

data Poly a = P [a] --borrar esto

--instance Eq Poly a where
instance (Num a, Eq a) => Eq (Poly a) where
    (P a) == (P b) = c == d where
        (P c) = clean (P a)
        (P d) = clean (P b)
    (P a) /= (P b) = c /= d where
        (P c) = clean (P a)
        (P d) = clean (P b)

--instance Show Poly a where
instance (Num a, Eq a, Show a) => Show (Poly a) where
    show (P []) = ""
    show (P [0]) = "0"
    show (P a) = auxShow (clean (P a)) 0

instance Num a => Num (Poly a) where
    (+)         = plus
    (*)         = times
    negate      = negate'
    fromInteger = fromInteger'
    
plus :: Num a => Poly a -> Poly a -> Poly a
plus (P []) (P []) = P []
plus (P a) (P []) = P a
plus (P []) (P b) = P b
plus (P (x:xs)) (P (y:ys)) = P (x+y : (auxPlus (P xs) (P ys)))

times :: Num a => Poly a -> Poly a -> Poly a
times (P []) (P []) = P []
times (P a) (P []) = P []
times (P []) (P b) = P []
times (P (x:xs)) (P b) = plus (P (map (*x) (b))) (P z) where
    z = 0:y where
        (P y) = times (P xs) (P b)

negate' :: Num a => Poly a -> Poly a
negate' (P []) = P []
negate' (P a) = P (map negate a)

fromInteger' :: Num a => Integer -> Poly a
fromInteger' a = P [fromInteger a]

clean :: (Num a, Eq a) => Poly a -> Poly a
clean (P []) = P []
clean (P x) = if (last x) == 0 then clean (P (take (length x - 1) x)) else P x

auxShow :: (Num a, Eq a, Show a) => Poly a -> Int -> String
auxShow (P []) _ = ""
auxShow (P [0]) _ = ""
auxShow (P [x]) 0 = show x
auxShow (P [1]) 1 = "x"
auxShow (P [-1]) 1 = "-x"
auxShow (P [x]) 1 = show x ++ "x"
auxShow (P [1]) n = "x^" ++ show n
auxShow (P [-1]) n = "-x^" ++ show n
auxShow (P [x]) n = show x ++ "x^" ++ show n
auxShow (P (x:xs)) n = if x == 0 then auxShow (P xs) (n+1) else auxShow (P xs) (n+1) ++ " + " ++ auxShow (P [x]) n

auxPlus :: Num a => Poly a -> Poly a -> [a]
auxPlus (P []) (P []) = []
auxPlus (P a) (P []) = a
auxPlus (P []) (P b) = b
auxPlus (P (x:xs)) (P (y:ys)) = (x+y) : (auxPlus (P xs) (P ys))

