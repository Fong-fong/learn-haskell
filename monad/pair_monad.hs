-- prove that the three monad laws hold for the pair monad
-- instance Monoid e => Monad ((,) e) where
-- 	(e, m) >>= k = let (e', m') = k m in (e <> e', m')
--  return m = (mempty, m)

-- the first monad law (left identity):
-- return a >>= k = k a
-- proof:
-- return a >>= k
-- = (mempty, a) >>= k
-- = let (e', m') = k a in (mempty <> e', m')
-- = let (e', m') = k a in (e', m')
-- = k a

-- the second monad law (right identity):
-- m >>= return = m
-- proof:
-- (e, m) >>= return
-- = let (e', m') = return m in (e <> e', m')
-- = let (e', m') = (mempty, m) in (e <> e', m')
-- = (e <> mempty , m)
-- = (e, m)

-- the third monad law (associativity):
-- m >>= (\x -> k x >>= h) = (m >>= k) >>= h
-- m :: (e, a)
-- k :: a -> (e, b)
-- h :: b -> (e, c)

-- proof:
-- (e, m) >>= (\x -> k x >>= h)
-- = let (e', m') = (\x -> k x >>= h) m in (e <> e', m')
-- = let (e', m') = (k m >>= h ) in (e <> e', m')
-- = let (e', m') = (let (e'', m'') = k m in (e'', m') >>= h ) in (e <> e', m')
-- = let (e', m') = (let (e'', m'') = k m in (let (e''',m''') = h m'' in (e'' <> e''',m''') ) ) in (e <> e', m')
-- : simplify the let-in expression by e' to e'' <> e''' and m' to  m'''
-- = let (e'', m'') = k m in let (e''',m''') = h m'' in (e <> e'' <> e''', m''')
-- : rename e''' to e'' , e'' to e' , m''' to m'' and m'' to m'
-- = let (e', m') = k m in let (e'', m'') = h m' in (e <> e' <> e'', m'')
-- = let (e', m') = k m in ( let (e'', m'') = h m' in (e <> e' <> e'', m'') )
-- = (let (e', m') = k m in (e <> e', m')) >>= h
-- = ((e, m) >>= k) >>= h




