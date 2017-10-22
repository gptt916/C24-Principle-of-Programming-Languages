module SetEq where
import Set
import SetShow


instance Eq a => Eq (Set a) where
    --(Set s) == (Set s') = (length s == length s') && ((s `intersect` s') == s) && ((s' `intersect` s) == s')


    (Set s) == (Set s') = subEqual s s' && subEqual s' s where
        subEqual [] _ = True
        subEqual (x:xs) [] = False
        subEqual (x:xs) (y:ys) = (x == y || subEqual [x] ys) && subEqual xs (y:ys)