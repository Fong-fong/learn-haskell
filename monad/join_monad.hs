-- implement these functions
maybeJoin :: Maybe (Maybe a) -> Maybe a
maybeJoin Nothing = Nothing
maybeJoin (Just x) = x

listJoin :: [[a]] -> [a]
listJoin [] = []
listJoin (x:xs) = x ++ listJoin xs

eitherJoin:: Either r (Either r a) -> Either r a
eitherJoin (Left x) = Left x
eitherJoin (Right y) = y

arrowJoin :: (r -> r -> a) -> r -> a
arrowJoin f x = f x x

-- what do we need to know about r?
pairJoin ::Semigroup r => (r, (r, a)) -> (r, a)
pairJoin (r, (r', x)) = (r <> r', x)