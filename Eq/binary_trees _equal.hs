
-- how should we define equality for binary trees?
-- when are two binary trees equal?


data BinaryTree a =
      Empty
    | Node (BinaryTree a) a (BinaryTree a)
  deriving (Show)


instance Eq a => Eq (BinaryTree a) where
    Empty == Empty = True
    Node l1 x r1 == Node l2 y r2 = x==y && l1==l2 && r1==r2
    _ == _ = False



equal' :: (Eq a) => (BinaryTree a ) ->(BinaryTree a ) -> Bool
equal' Empty Empty = True
equal' (Node l1 x r1) (Node l2 y r2) = x==y && equal' l1 l2 && equal' r1 r2
equal' _ _ = False