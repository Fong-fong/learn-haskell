
-- rewrite [(x,y) | x <- [2,3,5], y <- [1,2,4], even $ x+y]
-- without using list comprehension
-- be careful with ordering
-- hint: (,) is a (curried) function that constructs a pair
-- (,) :: a -> b -> (a, b)
-- hint: use map and flip wisely

--check
plus_even_pair':: Integral a => [a]-> [a]-> [(a,a)]
plus_even_pair' xs ys =[(x,y) | x <- xs, y <- ys,even $ x+y]

--predicate 
plus_even:: (Integral (a -> a), Num a) => a -> Bool
plus_even  = even . (+) 

--uncurry predicate 
uncurry_plus_even:: Integral b => (b, b) -> Bool
uncurry_plus_even =even.uncurry(+)

--combination two list with function
combinationWith :: (t -> a -> b) -> [t] -> [a] -> [b]
combinationWith f xs ys= concatMap (\x -> map (f x) ys) xs


--Answer
plus_even_pair:: Integral a => [a]-> [a]-> [(a,a)]
plus_even_pair xs ys = filter (uncurry_plus_even) (combinationWith (,) xs ys )


--test using list comprehension
using_list_comprehension::Integral b =>[(b,b)]
using_list_comprehension = plus_even_pair' [2,3,5] [1,2,4]


--test without using list comprehension
without_using_list_comprehension::Integral b =>[(b,b)]
without_using_list_comprehension = plus_even_pair [2,3,5] [1,2,4]