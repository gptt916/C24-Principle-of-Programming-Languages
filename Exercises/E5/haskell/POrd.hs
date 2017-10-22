module POrd where

import Set
import SetEq
import SetShow

class Eq a=> POrd a where
    pcompare :: a -> a -> POrdering

    lt :: a->a->Bool
    x `lt` y = pcompare x y == PLT && pcompare x y /= PEQ

    gt :: a->a->Bool
    x `gt` y = pcompare x y == PGT && pcompare x y /= PEQ

    lte :: a->a->Bool
    x `lte` y = pcompare x y == PLT || pcompare x y == PEQ

    gte :: a->a->Bool
    x `gte` y = pcompare x y == PGT || pcompare x y == PEQ

    inc :: a->a->Bool 
    x `inc` y = pcompare x y == PIN




    
    
    
    