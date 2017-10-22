module E4 where

-- |interleave (xs, ys) 
-- return a list of corresponding elements from xs and ys, 
-- interleaved. The remaining elements of the longer list
-- are ignored.

interleave :: ([a],[a])->[a]

interleave (xs,[]) = []
interleave ([],ys) =  []
interleave (x:xs,y:ys)= x:y:interleave (xs,ys)

-- |toPairs (xs, ys) 
-- return a list of pairs of corresponding elements from xs and ys, 
-- interleaved. The remaining elements of the longer list
-- are ignored.

toPairs :: ([a], [a]) -> [(a,a)]
toPairs (xs,[]) = []
toPairs ([],ys) =  []
toPairs (x:xs,y:ys) = (x,y):toPairs (xs,ys)

-- |repeat' (f, x, n)
-- return a list [x, f(x), f(f(x)), ..., f^n(x)]
-- reuires n >= 0

repeat' :: (t -> t, t, Int) -> [t]
repeat' (f, x, a) = if a == 0 then [x] else x:repeat'(f,f x,a-1)

-- |numNeg xs 
-- return a number of negative elements in xs
--  Use list comprehension!
numNeg :: (Num a, Ord a) => [a] -> Int
numNeg xs = length [x | x<- xs, x < 0]

-- |genSquares (low, high)
-- return a list of squares of even integers between low and high, inclusive.
-- Use list comprehension!
genSquares::(Int, Int)-> [Int]
genSquares (low, high) = [x^2| x<- [low .. high], even x]

-- |triples n 
-- return a list of triples (x,y,z) all less than or equal to n, such
-- that x^2 + y^2 == z^2, with no duplicate triples or premutations of
-- ealier triples.
-- Use list comprehension!
triples :: Int -> [(Int, Int, Int)]
triples n= [(x,y,z)|x<- [1..n],y<- [x..n],z <- [1..n], x^2+y^2==z^2]