
--rewrite (\l -> length l < 3) without using lambda expressions
--what's the type of your answer?
length_lt_3 :: [a] -> Bool
length_lt_3 = (<3).length
