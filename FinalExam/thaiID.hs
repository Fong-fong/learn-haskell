calcThaiIdChecksum :: Integral a => [a] -> a
calcThaiIdChecksum  numberId = (flip (mod) 10). (11 -) .(flip (mod) 11). 
    sum . (zipWith (*) [13,12..2]) . (take 12) $ numberId
   


calcThaiIdChecksum' :: Integral a => [a] -> a
calcThaiIdChecksum'  = (flip (mod) 10). (11 -) .(flip (mod) 11). 
    sum .(zipWith (*) [13,12..2]) . (take 12)