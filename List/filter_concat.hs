
-- what's the type of filter_concat?
filter_concat  :: ([a] -> Bool) -> [[a]] -> [a]
--can you avoid recursion in your definition?
filter_concat f xs = concat $ filter  f xs 