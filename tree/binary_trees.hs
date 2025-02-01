data Tree a =
      Empty
    | Node (Tree a) a (Tree a)
  deriving (Show)


fold_tree :: (a ->b->  b -> b)-> b ->  Tree a -> b
fold_tree  _ acc Empty = acc
fold_tree f acc (Node l v r) =  f v (fold_tree f acc l) (fold_tree f acc r)


-- define map for binary trees
-- what's the type?


map_for_tree :: ( a -> b ) -> Tree a -> Tree b
map_for_tree  _ Empty  = Empty
map_for_tree  f (Node l v r)  = Node (map_for_tree f l) (f v) (map_for_tree f r)


preorder :: Tree a -> [a]
preorder Empty         = []
preorder (Node l x r)  =
    [x] ++ preorder l ++ preorder r
    
inorder :: Tree a -> [a]
inorder Empty          = []
inorder (Node l x r)   =
    inorder l ++ [x] ++ inorder r

postorder ::Tree a -> [a]
postorder Empty        = []
postorder (Node l x r) =
    postorder l ++ postorder r ++ [x]



-- define fold for binary trees
-- what's the type?
-- case foldr ::  ( a-> b -> b) -> b -> Tree a -> b
-- case foldl :: (b -> a -> b) -> b -> Tree a -> b

-- how many different folds can you come up with?
-- Ans 6 way


foldr_preorder ::  ( a-> b -> b) -> b -> Tree a -> b
foldr_preorder f acc t =  foldr f acc (preorder t)

foldr_inorder ::  ( a-> b -> b) -> b -> Tree a -> b
foldr_inorder f acc t =  foldr f acc (inorder t)

foldr_postorder ::  ( a-> b -> b) -> b -> Tree a -> b
foldr_postorder f acc t =  foldr f acc (postorder t)

foldl_preorder :: (b -> a -> b) -> b -> Tree a -> b
foldl_preorder f acc t =  foldl f acc (preorder t)

foldl_inorder ::  (b -> a -> b) -> b -> Tree a -> b
foldl_inorder f acc t =  foldl f acc (inorder t)

foldl_postorder ::  (b -> a -> b) -> b -> Tree a -> b
foldl_postorder f acc t =  foldl f acc (postorder t)

-- write a function height that returns the heights of a given binary tree
-- height of the empty tree is 0
-- otherwise, take max of left child's height and right child's height, then add 1
height_tree :: (Ord b,Num b) => Tree a ->  b
height_tree Empty = 0 
height_tree (Node l _ r)  = (max (height_tree l) (height_tree r))+1  



-- write a function isBST that takes a binary tree, and determine if it is a binary search tree
-- what's the type?
-- hint: a helper function helps!


isBST :: Ord a => Tree a -> Bool
isBST Empty = True
isBST (Node l v r) =  (isBST l) && (isBST r) && (case (minimum_in_tree l,maximum_in_tree r) of
    (Nothing,Nothing) -> True
    (Nothing,Just x) -> v <= x
    (Just x,Nothing) -> x < v
    (Just x ,Just y ) -> (x < v) &&   (v <= y))


maximum_in_tree ::  Ord a => Tree a-> Maybe a
maximum_in_tree Empty = Nothing
maximum_in_tree (Node l v r) = case (maximum_in_tree l,maximum_in_tree r) of
    (Nothing , Nothing) -> Just v
    (Nothing , Just x) -> Just (max v x)
    (Just x , Nothing) -> Just (max v x)
    (Just x, Just y) -> Just (max v (max x y))


minimum_in_tree ::  Ord a => Tree a-> Maybe a
minimum_in_tree Empty = Nothing
minimum_in_tree (Node l v r) = case (minimum_in_tree l,minimum_in_tree r) of
    (Nothing , Nothing) -> Just v
    (Nothing , Just x) -> Just (min v x)
    (Just x , Nothing) -> Just (max v x)
    (Just x, Just y) -> Just (min v (min x y))
