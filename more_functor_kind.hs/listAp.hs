-- define function listAp ::
-- [a -> b] -> [a] -> [b]
-- listAp [] [1,2]            → []
-- listAp [(*2),(+5)] []      → []
-- listAp [(*2),(+5)] [1]     → [2,6]
-- listAp [(*2)] [1,2]        → [2,4]
-- listAp [(*2),(+5)] [1,2]   → [2,4,6,7]
-- hint: use list comprehension


listAp ::[a -> b] -> [a] -> [b]
listAp [] _ = []
listAp _ [] = []
listAp fs xs = [f x | f <- fs, x <- xs]