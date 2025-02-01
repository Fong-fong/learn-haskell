--what's the type of take_while?
take_while :: (a -> Bool) -> [a]->  [a]
take_while _ [] = []
take_while cond (x:xs) 
    | cond x = x: take_while cond xs
    | otherwise = []

