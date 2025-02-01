-- define function 
maybeBind :: Maybe a -> (a -> Maybe b) -> Maybe b
maybeBind Nothing _ = Nothing
maybeBind (Just x) f = f x

-- define function 
listBind :: [a] -> (a -> [b]) -> [b]
listBind [] _ = []
listBind (x:xs) f = f x ++ listBind xs f

-- define function 
eitherBind ::Either r a -> (a -> Either r b) -> Either r b
eitherBind (Left x) _ = Left x
eitherBind (Right y) f = f y

-- define function 
arrowBind :: (r -> a) -> (a -> (r -> b)) -> (r -> b)
arrowBind f g = \x -> g (f x) x

-- define function 
-- what do we need to know about r?
-- r should be a monoid
pairBind :: Monoid r => (r, a) -> (a -> (r, b)) -> (r, b)
pairBind (r, x) f = let (r', y) = f x in (r <> r', y)
