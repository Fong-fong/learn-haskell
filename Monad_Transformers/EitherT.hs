import Data.Char

-- implement a monad transformer for Either monad:
-- EitherT a m b, wrapping m (Either a b)

class MonadTrans t where
  lift :: Monad m => m a -> t m a

newtype EitherT a m b =
  EitherT { runEitherT :: m (Either a b) }

instance MonadTrans (EitherT a) where
    lift ma = EitherT $ fmap Right ma

instance Monad m => Functor (EitherT a m) where
    fmap f (EitherT ma) = EitherT $ fmap (fmap f) ma

instance Monad m => Applicative (EitherT a m) where
    pure a = EitherT $ pure $ Right a
    EitherT mf <*> EitherT ma = EitherT $ do
        f <- mf
        a <- ma
        return $ f <*> a

instance Monad m => Monad (EitherT a m) where
    return = pure
    EitherT ma >>= mf = EitherT $ do
        a <- ma
        case a of
            Left l -> return $ Left l
            Right r -> runEitherT $ mf r



readEmail :: IO (Either String String)
readEmail = do
  putStrLn "Please enter your email!"
  str <- getLine
  if '@' `elem` str && '.' `elem` str
    then return $ Right str
    else return $ Left "Invalid email!"

readPassword :: IO (Either String String)
readPassword = do
  putStrLn "Please enter your Password!"
  str <- getLine
  case () of
    _ | length str < 8 -> return $ Left "Invalid ,password must be at least 8 characters.!"
      | null (filter isUpper str) -> return $ Left "Invalid ,password must include an uppercase letter.!"
      | null (filter isLower str) -> return $ Left "Invalid ,password must include an lowercase letter.!"
      | otherwise -> return $ Right str



readEmail' :: EitherT String IO String
readEmail' = EitherT readEmail

readPassword' :: EitherT String IO String
readPassword' = EitherT readPassword

signup' :: EitherT String IO (String, String)
signup' = do
  email <- readEmail'
  password <- readPassword'
  password2 <- readPassword'
  if password == password2
  then EitherT . return $ Right (email, password)
  else EitherT . return $ Left "Passwords do not match!"

main :: IO ()
main = do
  signupRes <- runEitherT signup'
  case signupRes of
    Left err -> putStrLn $ "Signup failed : " ++ err
    Right _ -> putStrLn "Thank you for signing up!"


