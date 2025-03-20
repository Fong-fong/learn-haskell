-- show that (,) is a bifunctor by implementing
pairBimap :: (a -> c) -> (b -> d) -> (a, b) -> (c, d)
pairBimap f g (a, b) = (f a, g b)

-- prove that these bifunctor laws hold:
-- pairBimap id id = id
-- proof :
-- pairBimap id id
-- = \ (a, b) -> pairBimap id id (a, b)
-- = \ (a, b) -> (id a, id b)
-- = \ (a, b) -> (a, b)
-- = id
-- QED


-- pairBimap (f . g) (h . i) = pairBimap f h . pairBimap g i
-- proof:
-- pairBimap (f . g) (h . i)
-- = \ (a, b) -> pairBimap (f . g) (h . i) (a, b)
-- = \ (a, b) -> ((f . g) a, (h . i) b)
-- = \ (a, b) -> (f (g a), h (i b))
-- = \ (a, b) -> pairBimap f h (g a, i b)
-- = \ (a, b) -> pairBimap f h ( pairBimap g i ( a , b) )
-- = \ (a, b) ->  pairBimap f h . pairBimap g i  ( a , b)
-- = pairBimap f h . pairBimap g i
-- QED

