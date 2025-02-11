-- improve your number-guessing game to randomize the desired number
-- can you reuse code from the previous version?
-- if not, try to refactor code to maximize code sharing
-- try to separate your code into pure and impure parts
-- the impure parts interact with the users
-- the pure parts deal with game logic
-- each part should be a function

import System.Random
import Text.Read


data Config = Config {
    target :: Int,
    count :: Int,
    limit :: Int,
    haveBounds :: Bool

}

type GuessBounds = Maybe (Int,Int)

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


readNumberWithBounds :: GuessBounds -> String -> IO Int
readNumberWithBounds bounds msg = do
    putStr $ msg ++ ": "
    line <- getLine
    case readEither line :: Either String Int of
        Left e -> do
            putStrLn e
            readNumberWithBounds bounds msg
        Right n -> do
            case bounds of
                Just (low, high) -> do
                    if n < low || n > high
                    then do
                        putStrLn $ "Number must be between " ++ show (low ) ++ " and " ++ show (high )
                        readNumberWithBounds bounds msg
                    else return n
                Nothing -> return n

updateGuessBounds :: GuessBounds -> Int ->Int -> GuessBounds
updateGuessBounds Nothing _ _  = Nothing
updateGuessBounds (Just (low, high)) target guess = Just newBound
    where
        newBound = case compare guess target of
            LT -> (max low (guess+1), high)
            GT -> (low, min high (guess-1))
            EQ -> (low, high)



runGame :: Int -> Int -> (Int -> Bool) -> GuessBounds -> IO ()
runGame num count cont guessBounds = do
    guess <- readNumberWithBounds guessBounds "Guess"
    let v = verdict num guess
    case v of
        Right m -> do
            putStrLn m
        Left m -> do
            putStrLn m
            if cont count
            then   do 
                let newBounds = updateGuessBounds guessBounds num guess
                runGame num (count+1) cont newBounds
            else putStrLn $ "Game over, it is " ++ show num


randomInt ::Int->Int-> IO Int
randomInt lower upper = do
    gen <- newStdGen
    let (n, _) = randomR (lower, upper) gen
    return n


v3 :: IO ()
v3 =do
    lower <- readNumber "Lower bound"
    upper <- readNumber "Upper bound"
    num <- randomInt lower upper
    lim <- readNumber "Guess limit"
    runGame num 1 (<lim) Nothing



-- improve your number-guessing game to reject impossible guesses
-- if the number entered is at least another guess that's already higher than the target
-- or if the number entered is at most another guess that's already lower than the target
-- don't count these guesses against the limit


v4 :: IO ()
v4 =do
    lower <- readNumber "Lower bound"
    upper <- readNumber "Upper bound"
    num <- randomInt lower upper
    lim <- readNumber "Guess limit"
    runGame num 1 (<lim) (Just (lower, upper))