module Lab9 where

-- -- max a b returns the max of a and b
-- max' ::(Ord a) => a -> a-> a
-- max' a b = if a > b then a else b

-- max'' a b = case a > b of 
--     True -> a
--     False -> b

-- max''' a b 
--     | a > b = a
--     | otherwise = b

-- data MyType = A|B|C

-- myFunc :: MyType -> Int

-- myFunc A = 1
-- myFunc B = 2
-- myFunc C = 3

-- mathematical expressions
-- leafs are numbers (integers for now)
-- internal nodes are either unary functions and one child
-- or binary functions and two children
data MathTree = Leaf Int
              | Unary (Int -> Int, MathTree)
              | Binary ((Int, Int) -> Int, MathTree, MathTree)

-- This is here to let Haskell know how to display the MathTree to you.
-- We will learn later what exactly this is and how it works.
instance Show MathTree where
    show (Leaf v) = show v
    show (Unary (f,t)) = "unary(" ++ show t ++ ")"
    show (Binary (f,l,r)) = "binary(" ++ show l ++ "," ++ show r ++ ")"

-- evaluate the math tree
eval :: MathTree -> Int
eval (Leaf v) = v
eval (Unary (f,t)) = f (eval t)
eval (Binary (f,l,r)) = f (eval l, eval r)


-- -- apply (op, t)
-- -- apply op to every leaf in t
apply :: (Int -> Int, MathTree) -> MathTree
apply (op, Leaf v) = Leaf (op v)
apply (op, Unary (f, t)) = Unary (f, apply (op, t)) 
apply (op, Binary(f,l,r)) = 
    Binary(f, 
        apply (op, l), 
        apply (op, r))


-- -- search (v, t)
-- -- return whether v is in tree t
search :: (Int, MathTree) -> Bool
search (num, Leaf v) = num == v
search (num, Unary(f,t)) = search(num, t)
search (num, Binary(f,l,r))= search(num, l) || search (num, r)

-- -- replace (v, v', t)
-- -- replace every value v in the leafs with v'
replace :: (Int, Int, MathTree) -> MathTree
replace (target, new, Leaf v) = if target == v then Leaf new else Leaf v
replace (target, new, Unary(f,t)) = Unary(f, replace(target, new, t))
replace (target, new, Binary(f,l,r))= 
    Binary(f, 
        replace(target, new, l), 
        replace(target, new, r))
