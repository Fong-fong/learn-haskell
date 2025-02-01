-- define map for pairs, if you can

mapForPair :: (a->b)-> (c->d)-> (a,c)->(b,d)
mapForPair f1 f2 (x ,y) = (f1 x,f2 y)

mapForPair' :: (a -> b) -> (a, a) -> (b, b)
mapForPair' f (x, y) = (f x, f y)