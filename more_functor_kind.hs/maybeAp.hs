-- define function maybeAp ::
-- Maybe (a -> b) -> Maybe a -> Maybe b
-- maybeAp Nothing (Just 3)     → Nothing
-- maybeAp (Just (*2)) Nothing  → Nothing
-- maybeAp (Just (*2)) (Just 3) → Just 6
-- maybeAp
--   (maybeAp (Just (-)) (Just 25))
--   (Just 47)               → Just (-22)

maybeAp :: Maybe (a -> b) -> Maybe a -> Maybe b
maybeAp Nothing _ = Nothing
maybeAp _ Nothing = Nothing
maybeAp (Just f) (Just x) = Just (f x)