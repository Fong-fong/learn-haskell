-- prove that the four applicative functor laws hold for (->) r applicative functor
-- hint: apply each side of the equality to an argument (of type r), and check that both sides are indeed equal
-- instance Applicative ((->) r) where
-- 	pure = const
-- 	(<*>) f g x = f x (g x)


-- the first applicative functor law (identity):
-- pure id <*> v = v
-- proof:
-- pure id <*> V 
-- = const id <*> V 
-- = (\x -> id (v x))
-- = (\x -> v x)
-- = v

-- the second applicative functor law (composition):
--pure (.) <*> u <*> v <*> w = u <*> (v <*> w)
-- u :: X (b -> c), v :: X (a -> b), w :: X a
-- proof:
-- pure (.) <*> u <*> v <*> w
-- = const (.) <*> u <*> v <*> w
-- = (\x -> const (.) x (u x) ) <*> v <*> w
-- = (\x -> (.) (u x) ) <*> v <*> w
-- =( \x -> (u x) . ) <*> v <*> w
-- =(\y -> ( \x -> (u x) . ) y (v y) )<*> w
-- =\z -> (\y -> ( \x -> (u x) . ) y (v y)) z (w z)
-- =\z -> (( \x -> (u x) . ) z (v z))  (w z)
-- =\z -> ((u z) . (v z))  (w z)
-- =\z -> (u z)  ((v z)  (w z))
-- = \z -> u z (v z (w z))
-- = \z -> u z ((\y -> v y (w y)) z)
-- = \z -> u z ((v <*> w) z)
-- = u <*> (v <*> w)

-- the third applicative functor law (homomorphism):
-- pure f <*> pure x = pure (f x)
-- proof:
-- pure f <*> pure x
-- = (\y -> const f y (const x y))
-- = (\y -> f (x))
-- = (\_ -> f x)
-- = const f x
-- = pure (f x)



-- the fourth applicative functor law (interchange):
-- u <*> pure y = pure ($ y) <*> u
-- u :: X (a -> b)
-- y :: a
-- ($ y) :: (a -> b) -> b
-- proof:
-- u <*> pure y
-- = u <*> (\_ -> y)
-- = \x -> u x ((\_ -> y) x)
-- = \x -> u x y
-- = \x -> u x $ y
-- = \x -> ($ y) (u x)
-- = \x -> ((\_ -> ($ y)) x) (u x)
-- = \x -> (const ($ y) x (u x)
-- = const ($ y) <*> u



