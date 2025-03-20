-- implement functions that have the following types:
-- write a proof that corresponds to each of the written functions
data Void = Void Void

--(a -> b -> c) -> (a -> b) -> a -> c
imp::(a -> b -> c) -> (a -> b) -> a -> c
imp f g x = f x (g x)

-- (A => B => C) => (A => B) => A => C
-- proof:
-- 1. Assume (A => B => C) is ture
-- 2. Assume (A => B) is true
-- 3. Assume A is true
-- 4. By 2 and 3, B is true
-- 5. By 1 and 3, B => C is true
-- 6. By 4 and 5, C is true
-- QED



-- (a, b) -> Either a b
andToInl::(a, b) -> Either a b
andToInl (a, _) = Left a

andToInr::(a, b) -> Either a b
andToInr (_, b) = Right b

-- A  ∧  B => A ∨  B
-- proof:
-- 1. Assume A  ∧  B is true
-- 2. By 1, A is true
-- 3. By 1, B is true
-- 4. By 2, A or B is true
-- QED


-- (a -> b, a) -> b
impInLAnd ::(a -> b, a) -> b
impInLAnd (f, x) = f x

-- ((A => B)  ∧  A) => B
-- proof:
-- 1. Assume (A => B)  ∧  A is true
-- 2. By 1, A => B is true
-- 3. By 1, A is true
-- 4. By 2 and 3, B is true
-- QED


-- false
absurd :: Void -> a
absurd (Void x) = absurd x


-- Either (a -> Void) b -> a -> b
orNegInL ::Either (a -> Void) b -> a -> b
orNegInL (Left f) x = absurd (f x)
orNegInL (Right b) _ = b

-- (¬A ∨  B) => A => B
-- proof:
-- 1. Assume (¬A ∨  B) is true
-- 2. Assume A is true
-- 3. By 2, ¬A is false
-- 4. By 1 and 3, B is true
-- QED

-- (A => B => (¬C ∨  D)) =>  (B => C) => ( A => B => D )
test ::((a,b) ->  Either (c -> Void) d) -> (b -> c) -> (a -> b -> d)
test f g x y = case f (x, y) of
    Left h -> absurd (h (g y))
    Right d -> d


-- false
-- absurd :: Void -> a
-- absurd (Void x) = absurd x




