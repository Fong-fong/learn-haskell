-- define type NAryTree for n-ary trees, and implement preorder and postorder traversals


data NAryTree a = Empty | Node a [ NAryTree a ] deriving (Show)


nAryPerorder :: NAryTree a -> [a]
nAryPerorder Empty = []
nAryPerorder (Node x l) = [x] ++ concatMap nAryPerorder l
    

nAryPostorder :: NAryTree a -> [a]
nAryPostorder Empty = []
nAryPostorder (Node x l) =  (concatMap nAryPostorder l) ++[x]


-- clear_empty_tree :: NAryTree a -> NAryTree a
-- clear_empty_tree Empty = Empty
-- clear_empty_tree (Node x l) = Node x (map clear_empty_tree $ filter_empty $ l)



-- filter_empty ::  [NAryTree a] -> [NAryTree a]
-- filter_empty  [] = []
-- filter_empty  l = reverse $ filter_empty_aux l []
--     where
--         filter_empty_aux [] acc = acc
--         filter_empty_aux (x:xs) acc = case x of 
--             Empty -> (filter_empty_aux xs acc)
--             _ -> x:(filter_empty_aux xs acc)


isSorted [] = True 
isSorted [x] = True 
isSorted (x:y:xs) = x <= y && isSorted (y:xs)