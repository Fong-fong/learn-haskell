data Tree a =
      Empty
    | Node (Tree a) a (Tree a)
  deriving (Show)


-- write a function height that returns the heights of a given binary tree
-- height of the empty tree is 0
-- otherwise, take max of left child's height and right child's height, then add 1
height_tree ::  Tree a ->  Integer
height_tree Empty = 0 
height_tree (Node l _ r)  = (max (height_tree l) (height_tree r))+1  
