-- rewrite list reverse using left fold
reverse_using_left_fold :: [a] -> [a]
reverse_using_left_fold  = foldl (flip (:)) [] 

-- rewrite list reverse using right fold
reverse_using_right_fold :: [a] -> [a]
-- reverse_using_right_fold  = foldr (\x -> flip (++) [x] )  []
reverse_using_right_fold  = foldr (flip (++) . (:[]))  []

-- which version is more efficient, and why?
-- Ans reverse_using_left_fold  is more efficient than reverse_using_right_fold
-- Big-O reverse_using_left_fold is O(n) because (:) use O(1) and foldl use O(n)
-- Big-O reverse_using_right_fold is O(n^2) because (++) use O(n) and foldr use O(n)



-- rewrite map using fold
map_using_fold :: (a -> b) -> [a] -> [b]
map_using_fold f  = foldr (\x -> (:) $ f x ) [] 

-- rewrite filter using fold
filter_using_fold :: (a -> Bool) -> [a] -> [a]
filter_using_fold p  = foldr (\x acc -> if (p x) then x:acc else acc ) [] 