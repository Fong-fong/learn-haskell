-- suppose we want to define a data type that counts the number of transformations done to the data:
data COp a = CVal Int a
    deriving (Show)
-- is this an appropriate definition of a functor for COp?
--Ans No, this is not an appropriate definition of a functor for COp.
instance Functor COp where
  fmap f (CVal c v)
      = CVal (c+1) (f v)

-- Ans No, this is not an appropriate definition of a functor for COp.

-- what if f = id?  what should we say about the number of transformations?
-- Ans If 𝑓 =id, the counter c is incremented. This is inconsistent with the functor laws
--functor laws (1)
-- for COp
-- fmap id (CVal c v) = CVal (c+1) (id v)
--                    = CVal (c+1) (v)
--                    != (CVal c v) 




-----------------------------------------




-- define a functor for (->) r:
class  Functor' f  where
    fmap'        :: (a -> b) -> f a -> f b

instance Functor' ((->) r') where
    fmap' f g = f . g

-- since fmap :: (a -> b) -> f a -> f b, this means for f = (->) r,
-- fmap :: (a->b) -> (r->a) -> (r->b)
