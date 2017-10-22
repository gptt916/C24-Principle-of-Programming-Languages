module SetShow where
import Set

instance Show a => Show (Set a) where
    show (Set a) = "{" ++ show' a ++ "}" where
        show' [] = ""
        show' [x] = show x
        show' (x:xs) = show x ++ "," ++ show' xs