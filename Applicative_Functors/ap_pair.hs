-- suppose we want to make (,) r an applicative functor
-- that means we need to implement
-- (<*>) ::
--   (r, a -> b) -> (r, a) -> (r, b)
-- r could be any type, for representing labels
-- but now we have two pieces of data containing labels (i.e., (r,a->b) and (r,a))
-- how should we implement (<*>) so that the resulting data contain appropriate label?

-- (<*>) ::(r, a -> b) -> (r, a) -> (r, b)
-- (<*>) (r, f) (r, x) = (r, f x)

-- how should we implement pure so that the initial label makes sense?
-- pure :: a -> (r, a)
-- pure x = ("something in type r like [] ,Noting ":: r, x)
