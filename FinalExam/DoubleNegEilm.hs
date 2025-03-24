data Void = Void Void


-- false
absurd :: Void -> a
absurd (Void x) = absurd x

-- ( P ∨  ¬P) => ¬¬P => P
dblNeg :: Either  (a -> Void) a -> ((a -> Void) ->Void) -> a
dblNeg (Right a) _ = a
dblNeg (Left na) nna = absurd (nna na)

-- เป็น pure function เพราะ 

-- proof:
-- 1. Assume ( P ∨  ¬P)  is true
-- 2. Assume ¬¬P is true
-- 3.1 case if  ¬P is ture then  ¬¬P is  ¬ture then ¬¬P is false contradiction  between ¬¬P is false  and ¬¬P is true
-- 3.2 case if  ¬P is false then  ¬¬P is  ¬false then ¬¬P is true make sense
-- 4. By 1 and 3.2 ,  P is true
-- QED


