-- how should we define equality for Maybe?
-- when are two Maybe's equal?

data Maybe' a = Nothing' | Just' a

instance Eq a => Eq (Maybe' a ) where
    Nothing' == Nothing' = True
    (Just' x ) == (Just' y ) =  x==y
    _ == _ = False



equal' :: (Eq a) => (Maybe' a ) ->(Maybe' a ) -> Bool
equal' Nothing' Nothing' = True
equal' (Just' x ) (Just' y ) = x==y
equal' _ _ = False