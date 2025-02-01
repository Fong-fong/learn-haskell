-- write function elem that determines whether a given element is a member of a list
elem' ::Eq a=> a -> [a] -> Bool
elem' _ [] = False
elem' c (x:xs) = if c==x then True else (elem' c xs)


--what's the type of elem?
--Ans elem' ::Eq a=> a -> [a] -> Bool
-- can you use fold?
elem_using_fold ::Eq a=> a -> [a] -> Bool
elem_using_fold c = foldr (\x -> if c == x then (const True) else id) False 


-- rewrite partition using fold
-- you might need to write another function
-- be sure to think about efficiency by choosing the appropriate kind of fold

partition_using_fold ::(a -> Bool) -> [a]->  ([a],[a])
partition_using_fold p  = foldr (partition_aux) ([],[])
    where
        partition_aux y (l,r)
            | p y       = (y:l, r)
            | otherwise = (l, y:r)

-- challenge (extra credits):
-- define foldl in terms of foldr
foldl_using_foldr ::Foldable t => (b -> a -> b) -> b -> t a -> b
foldl_using_foldr f acc bs = foldr (\b g x -> g (f x b)) id bs acc

-- can you do the other direction?
foldr_using_foldl ::Foldable t => (a -> b -> b) -> b -> t a -> b
foldr_using_foldl f acc bs = foldl (\g b x -> g (f b x)) id bs acc