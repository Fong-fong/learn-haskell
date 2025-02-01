-- examples and from each other
-- be sure to reason about monoid laws
-- using newtype, declare monoid instances for Bool, where
-- operator: (&&)
-- operator: (||)

newtype And = And Bool
  deriving (Eq, Read, Show)

instance Semigroup And where
    And x <> And y = And (x && y)

instance Monoid And where
    mempty = And True

newtype Or = Or Bool
    deriving (Eq, Read, Show)

instance Semigroup Or where
    Or x <> Or y = Or (x || y)

instance Monoid Or where
    mempty = Or False