-- implement a monad transformer for the arrow monad:
-- ContT r m a, wrapping m (r -> a)
class MonadTrans t where
  lift :: Monad m => m a -> t m a

newtype ContT r m a =
  ContT { runContT :: (a -> m r) -> m r }

instance MonadTrans (ContT r) where
    lift ma = ContT $ (ma >>=) 

instance Monad m => Functor (ContT r m) where
    fmap f (ContT g) = ContT $ \k -> g $ k . f

instance Monad m => Applicative (ContT r m) where
    pure a = ContT $ \k -> k a
    ContT mf <*> ContT ma = 
        ContT $ \k -> mf $ \f -> ma $ (\a -> k $ f a)

instance Monad m => Monad (ContT r m) where
    return = pure
    ContT ma >>= f = ContT $ \k -> ma $ \a -> runContT (f a) k