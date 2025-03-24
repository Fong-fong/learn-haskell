
test :: (a-> Bool) ->  (a-> Bool) ->  [a] -> [a]
test p1 p2 l = (filter p1 . filter p2) l


-- filter p1 . filter p2 = filter p2 . filter p1
-- proof : 
-- 

allTure ::[Bool] ->Bool
allTure = all id

applyPredWithArg :: [(a->Bool)] -> a->[Bool]
applyPredWithArg fs arg  = fmap ($ arg) fs 





filterWithListPred :: [(a->Bool)] ->  [a] ->[a]
filterWithListPred fs xs = filter (allTure . applyPredWithArg fs)  xs

allFilter :: [(a->Bool)] ->  [a] ->[a]
allFilter preds xs = filter (allTure . applyPredWithArg preds)  xs
    where
        allTure = all id
        applyPreds fs arg  = fmap ($ arg) fs 


vertion1 :: (b -> Bool) -> (a -> b) -> [a] -> [a]
vertion1 p f = filter (p . f) 


vertion2 :: (b -> Bool) -> (a -> b) -> [a] -> [b]
vertion2 p f  = filter p . map f