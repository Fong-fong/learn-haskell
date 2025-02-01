-- define type Month whose values are months in a year
data Month  = January | February | March 
    | April | May | June
    | July | August | September 
    | October | November | December deriving (Show)


-- implement function
-- daysInMonth :: Month -> Integer
daysInMonth  :: Month ->  Integer
daysInMonth  m = case m of
    January   -> 31
    February  -> 28
    March     -> 31
    April     -> 30
    May       -> 31
    June      -> 30
    July      -> 31
    August    -> 31
    September -> 30
    October   -> 31
    November  -> 30
    December  -> 31


nextMonth :: Month -> Month
nextMonth month = case month of
    January   -> February
    February  -> March
    March     -> April
    April     -> May
    May       -> June
    June      -> July
    July      -> August
    August    -> September
    September -> October
    October   -> November
    November  -> December
    December  -> January 


-- implement function
-- nextDay :: Integer -> Month -> (Integer, Month)
-- that takes date/month and returns the following date/month

nextDay :: Integer -> Month -> (Integer, Month)
nextDay d m 
    | d <= 0 = error "impossible date"
    | d < daysInMonth m = (d+1 , m)
    | d == daysInMonth m = (1 , nextMonth m)
    | otherwise  =  error "impossible date"
