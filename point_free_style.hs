-- write this function in point-free style:
-- contains1 = \x l-> any (x<) l 
-- hint: any :: (a -> Bool) -> [a] -> Bool
-- any' :: (a -> Bool) -> [a] -> Bool
-- any' f l = or $ map f l
-- contains1 = \x -> any (x<) 
-- contains1 = \x -> any . (<) x 
contains1::Ord a => a -> [a] -> Bool
contains1 = any . (<) 


-- write this function in point-free style:
-- contains2 = \l x -> any (x<) l
-- hint: use flip function
-- contains2 = \l x -> any (x<) l
-- contains2 = flip (\x l-> any (x<) l )
-- contains2 = flip (\x -> any (x<) )
-- contains2 = flip (\x -> any. (<) x )

contains2::Ord a => [a] -> a -> Bool
contains2 = flip (any . (<)) 


