-- how should we define equality for lists?
-- when are two lists equal?



data List' a = Nil | Con a (List' a)

instance Eq a => Eq ( List' a ) where
    Nil == Nil = True
    Con x xs == Con y ys = x==y && xs==ys
    _ == _ = False


equal' :: (Eq a) => (List' a ) ->(List' a ) -> Bool
equal' Nil Nil = True
equal' (Con x xs) (Con y ys) = x==y && equal' xs ys
equal' _ _ = False