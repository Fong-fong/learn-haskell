-- prove that state monad satisfies functor laws
-- hint: for composition law, work from right to left


newtype State s a =
    State { runState :: s -> (a, s) }

instance Functor (State s) where
    fmap :: (a -> b)
      -> State s a -> State s b
    fmap f (State g) = State $ \s ->
        let (x, s') = g s
        in (f x, s')


-- the first functor law:
-- fmap id = id
-- fmap id 
-- \(State g) -> fmap id (State g) 
-- = \(State g) -> State $ \s ->  let (x, s') = g s in (id x, s')
-- = \(State g) -> State $ \s ->  let (x, s') = g s in (x, s')
-- = \(State g) -> State $ \s ->  g s
-- = \(State g) -> State g
-- = \(State g) -> id (State g)
-- = id

-- the second functor law:
-- fmap (f . g) = fmap f . fmap g
-- fmap f . fmap g 
-- = \(State h) -> fmap f . fmap g (State h)
-- = \(State h) -> fmap f (fmap g (State h))
-- = \(State h) -> fmap f (State $ \s -> let (x, s') = h s in (g x, s'))
-- = \(State h) -> State $ \s3 ->   let (x', s4 ) = ( \s -> let (x, s') = h s in (g x, s')) s3 in (f x', s4 ')
-- = \(State h) -> State $ \s3 ->   let (x', s4 ) =  ( let (x, s') = h s3 in (g x, s') ) in (f x', s4 ')
-- : Simplify the let-in expression
-- = \(State h) -> State $ \s3 ->   let (g x, s') =  (let (x, s') = h s3 in (g x, s')) in (f (g x), s')
-- : Simplify the let-in expression
-- = \(State h) -> State $ \s3 ->   let (x, s') = h s3 in (f (g x), s')
-- = \(State h) -> State $ \s3 ->   let (x, s') = h s3 in ((f . g) x, s')
-- = \(State h) -> fmap (f . g) (State h)
-- = fmap (f . g)



