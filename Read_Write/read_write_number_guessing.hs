-- improve your number-guessing game to report all the numbers guessed after the game is over (win or lose)
-- can you reuse code from the previous version?
-- if not, try to refactor code to maximize code sharing
-- try to separate your code into pure and impure parts
-- the impure parts interact with the users
-- the pure parts deal with game logic
-- each part should be a function


import System.Random
import Text.Read


type GuessRange = (Maybe Int,Maybe Int)

verdict :: Int -> Int -> Either String String
verdict target guess = do
    case compare guess target of
        EQ -> Right "You win!"
        LT -> Left "Too low"
        GT -> Left "Too high"

readTarget :: IO Int
readTarget = readNumber "Target number"

readNumber :: String -> IO Int
readNumber msg = do
    putStr $ msg ++ ": "
    line <- getLine
    case readEither line :: Either String Int of
        Left e -> do
            putStrLn e
            readNumber msg
        Right n -> return n

inRange :: GuessRange -> Int -> Bool
inRange (lo, hi) guess =
    maybe True (< guess) lo
    && maybe True (> guess) hi

readGuess :: GuessRange -> IO Int
readGuess range = do
    guess <- readNumber "Guess"
    if inRange range guess
    then return guess
    else do
        putStrLn "Impossible answer"
        readGuess range

verdict' :: Int -> Int -> GuessRange -> Either (String, GuessRange) String
verdict' target guess (lo, hi) = do
    case compare guess target of
        EQ -> Right "You win!"
        LT -> Left ("Too low", (Just guess, hi))
        GT -> Left ("Too high", (lo, Just guess))



        
runGameRg :: Int -> GuessRange -> Int -> (Int -> Bool) -> IO ()
runGameRg num range count cont = do
    guess <- readGuess range
    let v = verdict' num guess range
    case v of
        Right m -> do
            putStrLn m
        Left (m, range') -> do
            putStrLn m
            if cont count
            then runGameRg
                num range' (count+1) cont
            else putStrLn "Game over"


randomInt ::Int->Int-> IO Int
randomInt lower upper = do
    gen <- newStdGen
    let (n, _) = randomR (lower, upper) gen
    return n




v4 :: IO ()
v4 =do
    lower <- readNumber "Lower bound"
    upper <- readNumber "Upper bound"
    num <- randomInt lower upper
    lim <- readNumber "Guess limit"
    runGameRg num (Just lower, Just upper) 1 (<lim)

-- CallGuess
newtype CallGuess = CallGuess {
  runCallGuess :: [Int]
}

instance Semigroup CallGuess where
  (<>) (CallGuess a) (CallGuess b) = CallGuess (a <> b)

instance Monoid CallGuess where
  mempty = CallGuess []

instance Show CallGuess where
  show (CallGuess n) = foldl (\acc x -> acc ++ show x ++ " , ") "" n


--Monad Transformer WriterT
newtype WriterT w m a = WriterCallGuess {
  runWriterCallGuess :: m(a ,w)
}

-- Functor WriterT
instance Functor m => Functor (WriterT w m) where
  fmap :: (a -> b) -> WriterT w m a -> WriterT w m b
  fmap f (WriterCallGuess m) = WriterCallGuess $ fmap (\(a, w) -> (f a, w)) m

-- Applicative WriterT
instance (Monad m,Monoid w) => Applicative (WriterT w m) where
  pure :: a -> WriterT w m a
  pure x = WriterCallGuess $ pure (x, mempty)
  (<*>) :: WriterT w m (a -> b) -> WriterT w m a -> WriterT w m b
  mf <*> mx =  mf >>= \f -> fmap f mx

-- Monad WriterT
instance (Monad m,Monoid w) => Monad (WriterT w m) where
  (>>=) :: WriterT w m a -> (a -> WriterT w m b) -> WriterT w m b
  mx >>= f = fmap f mx >>=id


class MonadTrans t where
  lift' :: Monad m => m a -> t m a

instance Monoid w => MonadTrans (WriterT w) where
  lift' :: Monad m => m a -> WriterT w m a
  lift' m = WriterCallGuess $ do
    a <- m
    return (a, mempty)

-- Monad Writer
tell :: (Monad m, Monoid w) => w -> WriterT w m ()
tell w = WriterCallGuess $ return ((), w)


type LogGuess =  WriterT CallGuess IO


-- Game with Writer

runGameRg' :: Int -> GuessRange -> Int -> (Int -> Bool) -> LogGuess ()
runGameRg' num range count cont = do
    guess <- lift' $ readGuess range
    tell $ CallGuess [guess]
    let v = verdict' num guess range
    case v of
        Right m -> do
            lift' $ putStrLn m
        Left (m, range') -> do
            lift' $ putStrLn m
            if cont count
            then runGameRg'
                num range' (count+1) cont
            else lift' $ putStrLn "Game over"


v4' :: IO ()
v4' =do
    lower <- readNumber "Lower bound"
    upper <- readNumber "Upper bound"
    num <- randomInt lower upper
    lim <- readNumber "Guess limit"
    result <-runWriterCallGuess $ runGameRg' num ( Just (lower - 1), Just (upper +  1)) 1 (<lim)
    return $ fst result

v5 :: IO ()
v5 =do
    lower <- readNumber "Lower bound"
    upper <- readNumber "Upper bound"
    num <- randomInt (lower-1) (upper+1)
    lim <- readNumber "Guess limit"
    (_, logging) <-runWriterCallGuess $ runGameRg' num ( Just (lower - 1), Just (upper +  1)) 1 (<lim)
    putStrLn $ "All numbers guessed: " ++ show logging
    

