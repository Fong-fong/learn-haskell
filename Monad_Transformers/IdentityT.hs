class MonadTrans t where
  lift :: Monad m => m a -> t m a

-- implement a monad transformer for Identity monad:
-- IdentityT m a, wrapping m a

newtype IdentityT m a =
  IdentityT { runIdentityT :: m a }

instance MonadTrans IdentityT where
    lift = IdentityT

instance Monad m => Functor (IdentityT m) where
    fmap f (IdentityT ma) = IdentityT $ fmap f ma

instance Monad m => Applicative (IdentityT m) where
    pure = IdentityT . pure
    IdentityT mf <*> IdentityT ma = IdentityT $ mf <*> ma

instance Monad m => Monad (IdentityT m) where
    return = pure
    IdentityT ma >>= f = IdentityT $ ma >>= runIdentityT . f


