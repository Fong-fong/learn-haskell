data Tree a =
      Empty
    | Node (Tree a) a (Tree a)
  deriving (Show)



-- define map for binary trees
-- what's the type?

map_for_tree :: ( a -> b ) -> Tree a -> Tree b
map_for_tree  _ Empty  = Empty
map_for_tree  f (Node l v r)  = Node (map_for_tree f l) (f v) (map_for_tree f r)

