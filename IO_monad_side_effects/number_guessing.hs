-- write a number-guessing game
-- the first player enters the desired number
-- we'll deal with generating random numbers automatically next lecture
-- then, the second player keeps guessing the number until correct
-- try to separate your code into pure and impure parts
-- the impure parts interact with the users
-- the pure parts deal with game logic
-- each part should be a function


type Limit = Int
type Guess = Int
type Target = Int
type IsEnd = Bool


checkGuess :: Target -> Guess -> Bool
checkGuess guess target = guess == target


correctGuess :: Guess -> IO IsEnd
correctGuess guess = do
    putStrLn $ "You guessed it right\nit was " ++ (show guess)
    return True


incorrcetGuess ::  Guess-> IO IsEnd
incorrcetGuess guess= do
    putStrLn $ (show guess) ++  " is incorrcet, Try again!" 
    return False

getGuessInput :: IO Guess
getGuessInput = do 
    putStr "Enter the guess : "
    guessInput <- getLine
    let guessNum =(read guessInput ::Guess)
    return guessNum

guessingState :: (Guess -> Bool) -> IO IsEnd
guessingState checker = do
    guessNum <- getGuessInput
    if checker guessNum then correctGuess guessNum 
    else do 
        incorrcetGuess guessNum
        


warpGuessingState :: ((Guess -> Bool) -> IO IsEnd )->(Guess -> Bool) -> IO ()
warpGuessingState nextState checker = do
    isEnd <- guessingState checker
    if isEnd then return ()
    else warpGuessingState nextState checker



startState :: ((Guess -> Bool) ->IO()) -> IO ()
startState playState = do
    putStr "Enter the target number: "
    targetInput <- getLine
    let targetNum = (read targetInput :: Target)
    playState $ (checkGuess targetNum)


-- the main game function
number_guessing_game :: IO ()
number_guessing_game = startState $ warpGuessingState guessingState

    
-- improve your number-guessing game to limit the number of guesses
-- this number should also be entered by the first player

getLimitInput :: IO Limit
getLimitInput = do 
    putStr "Enter the Limit : "
    limitInput <- getLine
    return $ (read limitInput ::Limit)

setLimitGuessingState ::  (Limit -> (Guess -> Bool) -> IO()) -> (Guess -> Bool) -> IO ()
setLimitGuessingState  nextState checker = do
    limit <- getLimitInput
    if limit < 0 
    then putStrLn "Limit should be greater than 0"
    else nextState limit checker



limitedGuessingState :: Limit -> (Guess -> Bool) -> IO ()
limitedGuessingState limit checker = do
    if limit == 0 then putStrLn "You have reached the limit" 
    else do
        putStrLn $ "You have " ++ (show limit) ++ " guesses left"
        isEnd <-guessingState checker
        if isEnd then return ()
        else
            limitedGuessingState (limit-1) checker
        

-- the main game function
number_guessing_game_with_limit :: IO ()
number_guessing_game_with_limit = startState $ setLimitGuessingState limitedGuessingState

-- can you reuse code from the previous version?
-- 1.guessingState
-- 2.startState