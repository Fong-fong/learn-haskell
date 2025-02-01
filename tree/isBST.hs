data Tree a =
      Empty
    | Node (Tree a) a (Tree a)
  deriving (Show)


-- write a function isBST that takes a binary tree, and determine if it is a binary search tree
-- what's the type?
-- hint: a helper function helps!


isBST :: Ord a => Tree a -> Bool
isBST Empty = True
isBST (Node l v r) =  isBST l && isBST r && (case (maximum_in_tree l,minimum_in_tree r) of
    (Nothing,Nothing) -> True
    (Nothing,Just x) -> v <= x
    (Just x,Nothing) -> x < v
    (Just x ,Just y ) -> (x < v) &&   (v <= y))


maximum_in_tree ::  Ord a => Tree a-> Maybe a
maximum_in_tree Empty = Nothing
maximum_in_tree (Node l v r) = Just (case (maximum_in_tree l,maximum_in_tree r) of
    (Nothing , Nothing) ->  v
    (Nothing , Just x) ->  (max v x)
    (Just x , Nothing) ->  (max v x)
    (Just x, Just y) ->  (max v (max x y)))


minimum_in_tree ::  Ord a => Tree a-> Maybe a
minimum_in_tree Empty = Nothing
minimum_in_tree (Node l v r) = Just (case (minimum_in_tree l,minimum_in_tree r) of
    (Nothing , Nothing) ->  v
    (Nothing , Just x) ->  (min v x)
    (Just x , Nothing) ->  (min v x)
    (Just x, Just y) ->  (min v (min x y)))


