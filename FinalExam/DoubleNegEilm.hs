data Void = Void Void


-- false
absurd :: Void -> a
absurd (Void x) = absurd x

-- ( P ∨  ¬P) => ¬¬P => P
dblNeg :: Either  (a -> Void) a -> ((a -> Void) ->Void) -> a
dblNeg (Right a) _ = a
dblNeg (Left na) nna = absurd (nna na)

-- proof:
-- 1. Assume ( P ∨  ¬P)  is true
-- 2. Assume ¬¬P is true
-- 3. By 2, P is true
-- 4. By 1 and 3, B is true
-- QED


