-- write the following natural transformations

--Fmap list is 
-- fmap :: (a -> b) -> [a] -> [b]
-- fmap f [] = []
-- fmap f (x:xs) = f x : fmap f xs

-- Fmap Maybe is
-- fmap :: (a -> b) -> Maybe a -> Maybe b
-- fmap f Nothing = Nothing
-- fmap f (Just x) = Just (f x)

-- Maybe → list
maybeToList :: Maybe a -> [a]
maybeToList Nothing = []
maybeToList (Just x) = [x]
-- true or false, and why: for any f :: a -> b,
-- fmap f . maybeToList = maybeToList . fmap f
-- proof:
-- case : Nothing
-- fmap f . maybeToList $ Nothing
-- = fmap f . []
-- = []
-- = maybeToList Nothing
-- = maybeToList . fmap f $ Nothing
-- case : Just x
-- fmap f . maybeToList $ Just x
-- = fmap f . [x]
-- = [f x]
-- = maybeToList (Just (f x))
-- = maybeToList . fmap f $ Just x
-- QED

--Ans ture




-- list → Maybe
listToMaybe :: [a] -> Maybe a
listToMaybe [] = Nothing
listToMaybe (x:_) = Just x
-- true or false, and why: for any f :: a -> b,
-- fmap f . listToMaybe = listToMaybe . fmap f
-- case []
-- fmap f . listToMaybe $ []
-- = fmap f . Nothing
-- = Nothing
-- = listToMaybe []
-- = listToMaybe . fmap f $ []

-- case x:xs
-- on the LHS
-- fmap f . listToMaybe $ x:xs
-- = fmap f . Just x
-- = Just (f x)

-- on the RHS
-- listToMaybe . fmap f $ x:xs
-- = listToMaybe . [f x, fmap f xs]
-- = Just (f x)

-- LHS = RHS
-- QED

--Ans ture

