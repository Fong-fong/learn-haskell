data Rect a = Rect { w :: a, h :: a }

instance Functor Rect where
    fmap f (Rect x y) = Rect (f x) (f y)


-- fmap id = id 
-- proof: 
-- fmap Id 
-- = \Rect x y -> fmap Id (Rect x y)
-- = \Rect x y -> Rect ( id x ) (id  y)
-- = \Rect x y -> Rect x y
-- = id 


-- fmap (h.g) = fmap h . fmap g
-- proof :
-- fmap (h.g)
-- = \Rect x y -> fmap (h.g) (Rect x y)
-- = \Rect x y -> Rect ((h.g) x) ((h.g) y)
-- = \Rect x y -> Rect ((h (g x)) ((h (g y) )
-- = \Rect x y -> fmap h (Rect (g x) (g y)  )
-- = \Rect x y -> fmap h . fmap g (Rect x y )
-- = fmap h . fmap g

test :: Rect (b1 -> b2) -> Rect (a -> b1) -> Rect a -> Rect b2
test u v (Rect x y)=pure (.) <*> u <*> v <*> Rect x y



instance Applicative Rect where
    pure a = Rect a a
    Rect f g <*> Rect x y = Rect (f x) (g y)

-- pure id <*> v = v
-- proof:
-- pure id <*> v
-- =  Rect id id <*> v
-- let v = Rect x y
-- =  Rect id id <*> Rect x y
-- =  Rect ( id x ) (id  y)
-- =  Rect x y
-- = v


-- pure (.) <*> u <*> v <*> w = u <*> (v <*> w)
-- proof:
-- pure (.) <*> u <*> v <*> w
-- = pure (.) <*> u <*> v <*> w
-- let u = Rect u1 u2 
-- let v = Rect v1 v2 
-- let w = Rect w1 w2
-- = pure (.) <*> Rect u1 u2 <*> Rect v1 v2  <*> Rect w1 w2
-- = Rect (.) (.) <*> Rect u1 u2 <*> Rect v1 v2  <*> Rect w1 w2
-- = Rect (u1.) (u2.) <*> Rect v1 v2  <*> Rect w1 w2
-- = Rect (u1.v1) (u2.v2)  <*> Rect w1 w2
-- = Rect ((u1.v1) w1) ((u2.v2) w2 )
-- = Rect (u1 (v1 w1)) (u2 (v2 w2) )
-- = Rect u1 u2 <*> Rect (v1 w1)(v2 w2)
-- = Rect u1 u2 <*> (Rect (v1 w1)(v2 w2))
-- = Rect u1 u2 <*> (Rect v1 v2  <*> Rect w1 w2)
-- = u <*> (v <*> w)


-- pure f <*> pure x = pure (f x)
-- proof:
-- pure f <*> pure x
-- = Rect f f <*> Rect x x
-- = Rect (f x) (f x)
-- = pure (f x)


-- u <*> pure a = pure ($ a) <*> u
-- proof :
-- u <*> pure a
-- = u <*> Rect a a
-- let u = Rect u1 u2
-- = Rect u1 u2 <*> Rect a a
-- = Rect (u1 a) (u2 a)
-- = Rect ( ($ a) u1 ) ( ($ a) u2 )
-- =  Rect ($ a) ($ a) <*> Rect u1 u2 
-- =  pure ($ a) <*> Rect u1 u2 





instance Monad Rect where
    Rect x y >>= f = Rect (w (f x)) (h (f y))

-- return a >>= k = k a
-- proof:
-- return a >>= k 
-- = Rect a a >>= k 
-- = Rect (w (k a)) (h (k a))
-- known Rect (w (k a)) (h (k a)) = k a by definition data Rect a = Rect { w :: a, h :: a }
-- = k a


-- m >>= return = m
-- proof :
-- m >>= return
-- = m >>= return
-- let m = Rect m1 m2 
-- = Rect m1 m2  >>= return
-- = Rect (w (return m1)) (h (return m2))
-- = Rect (w (Rect m1 m1)) (h (Rect m2 m2))
-- = Rect m1 m2
-- = m



-- m >>= (\a -> f a >>= g) = (m >>= f) >>= g
-- proof :
-- m >>= (\a -> f a >>= g) 
-- = m >>= (\a -> f a >>= g)
-- let f a = Rect fa1 fa2
-- = m >>= (\a -> Rect fa1 fa2 >>= g)
-- = m >>= (\a -> Rect ( w ( g fa1) ) ( h ( g fa2)))
-- let m = Rect m1 m2
-- = Rect m1 m2 >>= (\a -> Rect ( w ( g fa1) ) ( h ( g fa2)))


join :: Rect (Rect a) -> Rect a
join ra = Rect (w (w ra ) ) (h ( h ra ))

(>=>) :: (a -> Rect b) -> (b -> Rect c) -> a -> Rect c
(>=>) f g x = Rect ( w ( g ( w (f x))))  ( h ( g ( h (f x))))
-- (>=>) f g x=  join $ fmap g (f x)
