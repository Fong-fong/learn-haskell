-- implement the following functions using only these combinators from the SKI combinator calculus:
-- S x y z = x z (y z)
-- K x y = x
-- I x = x
-- example: f :: a -> b -> b
-- f = K I
-- f x y = K I x y = I y = y
-- (.) :: (b->c) -> (a->b) -> (a->c)
-- (.) f g  =         
--      = S (K S) K f g        
--      = \ x->  S (K S) K f g x       
--      = \ x-> K S f (K f ) g x       
--      = \ x-> S (K f ) g x       
--      = \ x-> K f x ( g x )      
--      = \ x-> f (g x)
-- Ans (.) = S (K S) K


-- (&) :: a -> (a->b) -> b
-- (&) x f 
--      = S (K (S I)) (S (K K) I) x f
--      = (K (S I)) x ((S (K K) I) x) f
--      = (K (S I)) x (S (K K) I x) f
--      = (S I) (S (K K) I x) f
--      = (S I) ((K K x ) (I x)) f
--      = (S I) (K (I x)) f
--      = (S I) (K x) f
--      = S I (K x) f
--      = (I f) (K x f)
--      = f x
-- (&)   = S (K (S I)) (S (K K) I)


-- flip :: (a -> b -> c) -> b -> a -> c
-- flip f x y
    --  = S (S (K S) (S (S (K S) (S (K K) (K S ) ) ) K ) ) (K K ) f  x y
    --  = S (K S) (S (S (K S) (S (K K) (K S ) ) ) K ) f (K K f) x y
    --  = (K S f) (S (S (K S) (S (K K) (K S ) ) ) K f ) (K K f) x y
    --  = S (S (S (K S) (S (K K) (K S ) ) ) K f ) (K K f) x y
    --  = S (S (K S) (S (K K) (K S ) ) ) K f x ( (K K f) x) y
    --  = S (K S) (S (K K) (K S ) ) f (K f) x ( (K K f) x) y
    --  = K S f (S (K K) (K S ) f)  (K f) x ( (K K f) x) y
    --  = S (S (K K) (K S ) f)  (K f) x ( (K K f) x) y
    --  = S (K K) (K S ) f x (K f x) ( (K K f) x) y
    --  = (K K f) (K S f) x (K f x) ( (K K f) x) y
    --  = K (K S f) x (K f x) ( (K K f) x) y
    --  = (K S f) (K f x) ( (K K f) x) y
    --  = S (K f x) ( (K K f) x) y
    --  = S f ( (K K f) x) y
    --  = S f ( K x) y
    --  = f y ( K x y)
    --  = f y x

-- Ans flip = S (S (K S) (S (S (K S) (S (K K) (K S ) ) ) K ) ) (K K )





