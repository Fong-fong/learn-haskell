-- look up type Ordering
-- what is it for?
-- Ans it is used to represent the result of a comparison.
-- LT is less than
-- Eq is equal
-- GT is Greater than
-- ghci> :i Ordering
-- type Ordering :: *
-- data Ordering = LT | EQ | GT
orderingToString :: Ordering -> String
orderingToString LT = "Less than"
orderingToString EQ = "Equal"
orderingToString GT = "Greater than"
-- how many constructors are there?
-- Ans 3 constructors
-- how many ways can we pattern-match an Ordering value?
-- Ans 3 ways