-- prove that the three monad laws hold for the list monad
-- instance Monad []  where
-- 	xs >>= f = [y | x <- xs, y <- f x]
-- xs :: [a]
-- f :: (a -> [b])
-- 	xs >>= f = [y | x <- xs, y <- f x]
-- = concat(map f xs)


-- the first monad law (left identity):
-- return a >>= k = k a
-- proof:
-- return a >>= k
-- = [a] >>= k
-- = [y | x <- [a], y <- k x]
-- = k a

-- the second monad law (right identity):
-- m >>= return = m
-- proof:
-- [] >>= return
-- = [y | x <- [], y <- return x]
-- = [y | x <- [], y <- (:[]) x] 
-- = []

-- m >>= return
-- = [y | x <- m, y <- return x]
-- = [y | x <- m, y <- (:[]) x]
-- = m



-- the third monad law (associativity):
-- m >>= (\x -> k x >>= h) = (m >>= k) >>= h
-- proof:
-- [] >>= (\x -> k x >>= h)
-- = [y | x <- [], y <- (\x -> k x >>= h) x]
-- = []

-- m >>= (\x -> k x >>= h)
-- = [y | w <- m, y <- (\x -> k x >>= h) w]
-- = [y | w <- m, y <- k w >>= h]
-- = [y | w <- m, y <- [z | x <- k w, z <- h x]]
-- = [z | w <- m, x <- k w, z <- h x]
-- = [z | x <- [y | w <- m, y <- k w], z <- h x]
-- = [z | x <- (m >>= k), z <- h x]
-- = (m >>= k) >>= h





