data Tree a =
      Empty
    | Node (Tree a) a (Tree a)
  deriving (Show)





-- define fold for binary trees
-- what's the type?
-- fold_binary_trees :: (a ->  b -> b)-> b ->  Tree a -> b
-- how many different folds can you come up with?
-- 6 way

-- v -> l -> r
fold_preorderLR :: (a ->  b -> b)-> b ->  Tree a -> b
fold_preorderLR  _ acc Empty = acc
fold_preorderLR f acc (Node l v r) = fold_preorderLR f acc'' r
    where
        acc' = f  v acc
        acc'' = fold_preorderLR f acc' l


-- v -> r -> l
fold_preorderRL :: (a ->  b -> b)-> b ->  Tree a -> b
fold_preorderRL  _ acc Empty = acc
fold_preorderRL f acc (Node l v r) = fold_preorderRL f acc'' l
    where
        acc' = f  v acc
        acc'' = fold_preorderRL f acc' r

-- l -> v -> r
fold_inorderLR :: (a ->  b -> b)-> b ->  Tree a -> b
fold_inorderLR _ acc Empty = acc
fold_inorderLR f acc (Node l v r) = fold_inorderLR f acc'' r
    where
        acc' = fold_inorderLR f acc l
        acc''= f  v acc'

-- r -> v-> l
fold_inorderRL :: (a ->  b -> b)-> b ->  Tree a -> b
fold_inorderRL _ acc Empty = acc
fold_inorderRL f acc (Node l v r) = fold_inorderRL f acc'' l
    where
        acc' = fold_inorderRL f acc r
        acc''= f  v acc'

-- l -> r -> v
fold_postorderLR :: (a ->  b -> b)-> b ->  Tree a -> b
fold_postorderLR _ acc Empty = acc
fold_postorderLR f acc (Node l v r) = f v acc''
    where 
        acc' = fold_postorderLR f acc l
        acc'' = fold_postorderLR f acc' r

-- r -> l -> v
fold_postorderRL :: (a ->  b -> b)-> b ->  Tree a -> b
fold_postorderRL _ acc Empty = acc
fold_postorderRL f acc (Node l v r) = f v acc''
    where 
        acc' = fold_postorderRL f acc r
        acc'' = fold_postorderRL f acc' l