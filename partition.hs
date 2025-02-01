-- consider partition function:
partition :: (a -> Bool) -> [a]->  ([a],[a])
partition p [] = ([], [])
partition p (x:xs)
  | p x       = (x:l, r)
  | otherwise = (l, x:r)
  where (l, r) = partition p xs
-- what's the type of partition?
--  Ans partition :: (a -> Bool) -> [a]->  ([a],[a])
-- what does partition do?
-- Ans predicate p evaluates foreach elem in list 
--  if predicate p evaluates True concat list l (lift of pair)
--  if predicate p evaluates false concat list r (right of pair)
-- rewrite filter using partition
filter_using_partition:: (a -> Bool) -> [a]-> [a]
filter_using_partition p xs = fst $ partition p xs
-- hint: see fst and snd functions



-- rewrite quicksort without using list comprehension
quicksort:: (Ord a)=> [a]->[a]
quicksort []      = []
quicksort (hd:tl) =
    quicksort l ++ [hd] ++ quicksort r
  where l = [x | x <- tl, x < hd]
        r = [x | x <- tl, x >= hd]


quicksort_using_partition::(Ord a)=> [a]->[a]
quicksort_using_partition   []      = []
quicksort_using_partition  (hd:tl) =
    quicksort l ++ [hd] ++ quicksort r
    where (l, r) = partition (< hd) tl

-- hint: modify the version with where
-- hint: use partition


