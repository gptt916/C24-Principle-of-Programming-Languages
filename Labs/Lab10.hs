module Lab10 where

data Tree a = Empty | Node (a, Tree a, Tree a) deriving (Eq, Show)

-- numNodes t
-- Return the number of nodes in the tree t.
-- For example, 
--   numNodes t    should return    4
numNodes Empty = 0
numNodes (Node(n, left, right)) = 1 + numNodes left + numNodes right


-- numLevels t
-- Return the number of levels in the tree t (i.e., return
-- the number of nodes on the longest root-to-leaf path in
-- the tree t).
-- For example, 
--   numLevels t    should return    3
numLevels Empty = 0
numLevels (Node(n, left, right)) = 1 + max (numNodes left) (numNodes right)


-- tflip t
-- Return a tree which is a result of swapping, for every non-leaf
-- node in the tree, its right and left child.
-- For example, 
--   tflip t    should return a tree like this:
--        Node (1,
--            Node (3, 
--                  Empty,
--                  Node (4, Empty, Empty)),
--            Node (2, Empty, Empty))
tflip Empty = Empty
tflip (Node(n, left, right)) =  Node(n, tflip right, tflip left)

-- tmap f t
-- Return a tree which results from applying the function f to
-- every node in the tree t.
-- For example,
--   tmap (+1) t   should return a tree like this:
--   Node (2,
--         Node (3, Empty, Empty),
--         Node (4, 
--               Node (5, Empty, Empty),
--               Empty))
tmap f Empty = Empty
tmap f (Node(n, left, right)) = Node(f n, tmap f left, tmap f right)

