-- define map for Maybe type

mapForMaybe :: (a->b)-> Maybe a -> Maybe b
mapForMaybe _ Nothing = Nothing
mapForMaybe f (Just x) = Just (f x)