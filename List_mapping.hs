
list_map :: (a-> b) -> [a] -> [b]
list_map _ [] = []
list_map f (x:xs) = (f x) : (list_map f xs)


--what's the type of list_map?
-- Ans list_mapping :: (a-> b) -> [a] -> [b]\


--can you use tail recursion?

list_map' :: (a-> b) -> [a] -> [b]
list_map' f l = list_map_aux' l []
    where 
        list_map_aux'  [] res = res
        list_map_aux' (x:xs) res = list_map_aux' xs ( res ++ [(f x)] )

--write three more test cases for list_map

test1 = list_map (:[]) [1,2,3,4,5]
test2 = list_map (2^) [0,2,4,6,8,10]


fac' n
 | n==0 = 1
 | n> 0 = n * (fac'(n-1))
 |otherwise = error "negative number"

test3 = list_map fac' [1,2,3,4,5]