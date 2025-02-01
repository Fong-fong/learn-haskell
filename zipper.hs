
zipper :: ([a],[b]) -> [(a,b)]
zipper ([],_) = []
zipper (_,[]) = []
zipper (x:xs,y:ys) = ( x , y ) :(zipper (xs,ys))



zipper' :: [a] -> [b] -> [(a,b)]
zipper' [] _ = []
zipper' _ [] = []
zipper' (x:xs) (y:ys)  = ( x , y ) : zipper' xs ys 

-- what's the type of zipper'?
-- Ans type of zipper' is  [a] -> [b] -> [(a,b)]


--what's the type of zipper' []?
--Ans type of zipper' [] is [b] -> [(a,b)]


--what does zipper' [] do?
--Ans which input type is [b] , Output is [] with type [(a,b)] 
