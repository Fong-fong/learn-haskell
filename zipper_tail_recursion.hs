--rewrite zipper using tail recursion
zipper' :: [a]-> [b] -> [(a,b)]
zipper' ns ms = zipper_aux' ns ms []
    where 
        zipper_aux' [] _ res = res
        zipper_aux' _ [] res = res
        zipper_aux' (x:xs) (y:ys) res = zipper_aux' xs ys ( res ++ [(x,y)])
