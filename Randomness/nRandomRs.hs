-- write function nRandomRs that generates a list of n random values, each in a given range

import System.Random

nRandomRs :: (RandomGen g,UniformRange a, Integral n) => (a, a) -> n -> g -> ([a], g)
nRandomRs range n gen = go n gen []
    where
        go 0 g acc = (acc, g)
        go num g acc = let (x, g') = uniformR range g
                     in go (num-1) g' (x:acc)