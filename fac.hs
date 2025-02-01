import Numeric.Natural (Natural)

fac :: Natural-> Natural
fac 0 = 1
fac n = n * fac (n-1)

fac' n
 | n==0 = 1
 | n> 0 = n * (fac'(n-1))
 |otherwise = error "negative number"

facs = 1 : zipWith (*) [1..] facs


--what's the type of fac?
-- fac :: Natural-> Natural


--is your implementation of fac safe?
-- YES

-- if so, why?
-- because type Natural is Type representing arbitrary-precision non-negative integers.
-- input cannot be float or negative

--ref https://hackage.haskell.org/package/base-4.8.1.0/docs/Numeric-Natural.html#t:Natural