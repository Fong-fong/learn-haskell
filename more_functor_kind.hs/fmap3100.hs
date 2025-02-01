-- explain what fmap (*3) (+100) is


add100 :: Num a => a -> a
add100 = (+100)

times3 :: Num a => a -> a
times3 = (*3)

fmap3 :: (Functor f, Num b) => f b -> f b
fmap3 = fmap times3


-- fmap3100 is equivalent to fmap3 (*3) (+100)
fmap3100 :: Num b => b -> b
fmap3100 = fmap3 (+100)

-- fmap3100  it apply fmap with (*3) as fmap3 and (+100) as argument to fmap3 by  (+100) is functor that a type constructor of Num a => a -> a
-- So fmap (*3) (+100) is equivalent to (*3) . (+100) 