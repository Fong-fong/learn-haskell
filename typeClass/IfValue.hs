-- define instances of IfValue for as many types as you can

class IfValue a  where
    boolVal ::  a -> Bool

instance IfValue Int where
  boolVal 0 = False
  boolVal _ = True


instance IfValue Integer where
  boolVal 0 = False
  boolVal _ = True


instance IfValue Float where
  boolVal 0 = False
  boolVal _ = True


instance IfValue Double where
  boolVal 0 = False
  boolVal _ = True



instance IfValue a => IfValue [a] where
  boolVal [] = False
  boolVal (x:xs) = boolVal x || boolVal xs


instance IfValue a => IfValue (Maybe a) where
  boolVal Nothing = False
  boolVal (Just x) = boolVal x  


instance IfValue Bool where
  boolVal a = a

instance IfValue Char where
  boolVal '\0' = False
  boolVal _ = True


instance IfValue String where
  boolVal "" = False
  boolVal _ = True


instance (IfValue a,IfValue b)  => IfValue (a,b)  where
  boolVal (x,y) = boolVal x || boolVal y

instance IfValue () where
  boolVal () = True


instance IfValue Ordering where
  boolVal LT = False
  boolVal _ = True

