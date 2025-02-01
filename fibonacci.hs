--please take care of improper inputs
fib 0 = 0
fib 1 = 1
fib n =    if n <0 then error "negative number"
            else  fib (n-1) + fib (n-2)

--what's the type of your fib?
--fib :: (Num t, Num a, Ord t) => t -> a

--how long does your fib take to compute fib n?
-- Ans O(2^n)
--because fib(n) use fib(n-1) and fib(n-2) like a binary tree 


--are you satisfied with the running time?
--Ans No
--if not, what would you like to do to improve the efficiency?
--Ans use Memorization fib(n-1) and fib(n-2)
