-- prove that the three monad laws hold for the arrow monad
-- hint: unlock each side of the equality with a value of type r, and check that both sides are indeed equal
-- instance Monad ((->) r) where
-- 	f >>= k = \ r -> k (f r) r

-- the first monad law (left identity):
-- return a >>= k = k a
-- proof:
-- return a >>= k
-- = (\x -> a) >>= k
-- = \r -> k ((\x -> a) r) r
-- = \r -> k a r
-- = k a

-- the second monad law (right identity):
-- m >>= return = m
-- proof:
-- f >>= return
-- = \r -> return (f r) r
-- = \r -> (\x -> (f r)) r
-- = \r -> f r
-- = f

-- the third monad law (associativity):
-- m >>= (\x -> k x >>= h) = (m >>= k) >>= h
-- proof:
-- f >>= (\x -> k x >>= h)
-- = \r -> (\x -> k x >>= h) (f r) r
-- = \r -> (k (f r) >>= h) r
-- = \r -> h (k (f r) r) r
-- = \r -> h ((\x -> k (f x) x) r) r
-- = (\x -> k (f x) x) >>= h
-- = (f >>= k) >>= h

