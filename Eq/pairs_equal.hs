-- how should we define equality for pairs?
-- when are two pairs equal?


data Pair' a  b = Basket a b 

instance (Eq a, Eq b) => Eq (Pair' a b) where
    Basket x1 y1 == Basket x2 y2 = x1==x2 && y1==y2  


equal' :: (Eq a, Eq b) => (Pair' a b) ->(Pair' a b) -> Bool
equal' (Basket x1 y1) (Basket x2 y2) = x1 ==x2 && y1 ==y2

