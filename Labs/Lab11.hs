module Lab11 where

-- recall our datatype for binary trees
data BTree a = Empty | Node a (BTree a) (BTree a)

-- We want to be able to compare BTrees for equality. We say that two
-- BTrees are equal if they contain the same elements. The shapes of
-- the trees do not determine whether the trees are equal.
instance Eq a => Eq (BTree a) where
    --Base cases
    Empty == Empty = True
    Empty == (Node a l r) = False
    (Node a l r) == Empty = False
    t == t' = subEqual t t' && subEqual t' t where 
        subEqual Empty _ = True
        subEqual (Node a l r) tree = subEqual l tree
            && subEqual r tree 
            && eleEqual a tree where

            eleEqual _ Empty = False
            eleEqual a' (Node a l r) = 
                a' == a 
                || eleEqual a' l 
                || eleEqual a' r

-- want t == t' (see TestLab11 for definitions of t and t')

-- we now want to be able to display BTrees as follows (tilt your head to
-- the left!)
{-
    20
  15
10
    7
      6d
  5
    2
-}

instance Show a => Show (BTree a) where
    show a = show' a "" where
        --show':: a->String->String
        show' Empty _ = ""
        show' (Node a l r) b = show' r (b ++ "  ") ++ b ++ shows a "\n" ++ show' l (b ++ "  ")
    
-- Let's create a type class Sized, which prescribes a function 
-- size :: a -> Int, and provides definitions for 
-- empty :: a -> Bool and nonempty :: a -> Bool
class Sized a where
    size :: a -> Int
    empty, nonempty :: a -> Bool
    empty a = size a == 0
    nonempty a = not (empty a)

-- now let's state that Bool's are of size 1, by defining a
-- corresponding instance
instance Sized (Bool) where
    size _ = 1;

-- now let's make lists Sized, by defining the size of a list to be
-- its length

instance Sized [a] where
    size [] = 0
    size (x:xs) = 1 + size(xs)

-- finally, let's make our BTree's Sized, by defining the size of a
-- BTree to be the number of the elements stored in it
instance Sized (BTree a) where
    size Empty = 0
    size (Node a l r) = 1 + size l + size r