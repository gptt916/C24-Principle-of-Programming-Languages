module SetPOrd where

import Set
import SetEq
import POrd
import SetShow

subEqual [] _ = True
subEqual (x:xs) [] = False
subEqual (x:xs) (y:ys) = (x == y || subEqual [x] ys) && subEqual xs (y:ys)

instance Eq a => POrd (Set a) where
    pcompare (Set a) (Set b)
        | subEqual a b = PLT
        | subEqual b a = PGT
        | subEqual a b && subEqual b a = PEQ
        | otherwise = PIN