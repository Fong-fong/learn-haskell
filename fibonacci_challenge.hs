-- challenge: define fibs, the list of Fibonacci numbers, in the same way as facs
-- facs = 1 : zipWith (*) [1..] facs

fibs = 0:1:zipWith (+) fibs (tail fibs)