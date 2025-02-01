-- prove that the three monad laws hold for the Either monad
-- hint: prove by cases (Left vs Right)
-- instance Monad (Either e) where
--     	Right m >>= k = k m
--     	Left e  >>= _ = Left e

-- the first monad law (left identity):
-- return a >>= k = k a
-- proof:
-- return a >>= k
-- = Right a >>= k
-- = k a


--the second monad law (right identity):
-- m >>= return = m
-- proof:
-- Left e >>= return
-- = Left e
-- Right m >>= return
-- = return m
-- = Right m

-- the third monad law (associativity):
-- m >>= (\x -> k x >>= h) = (m >>= k) >>= h
-- proof:
-- Left e >>= (\x -> k x >>= h)
-- = Left e
-- = Left e >>= h
-- = (Left e >>= k) >>= h

-- Right m >>= (\x -> k x >>= h)
-- = k m >>= h
-- = (return m >>= k) >>= h
-- = (Right m >>= k) >>= h




