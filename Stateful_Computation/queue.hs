newtype State s a =
    State { runState :: s -> (a, s) }

-- implement a queue data structure
type Queue a = ([a], [a], Int)
-- and the following operations:
mkQueue :: [a] -> State (Queue a) ()
mkQueue [] = State $ \(_, _, _) -> ((), ([], [], 0))
mkQueue xs = State $ \(_, _, _) -> ((), (xs, [], length xs))

size :: State (Queue a) Int
size = State $ \(xs, ys, n) -> (n, (xs, ys, n))

isEmpty :: State (Queue a) Bool
isEmpty = State $ \(xs, ys, n)-> (n == 0, (xs, ys, n))

enqueue :: a -> State (Queue a) ()
enqueue y = State $ \(xs, ys, n) ->  ((), (xs, y:ys, n + 1))


    
dequeue :: State (Queue a) a
dequeue = State $ \(xs, ys, n) -> case (xs, ys) of
    ([], []) -> error "empty queue"
    (x:xs',ys') -> (x, (xs',  ys', n - 1))
    ([], y:ys')->  let  swapped = reverse (y:ys')                        in (head swapped, (tail swapped, [], n - 1))



empty :: State (Queue a) () -- empty q
empty = mkQueue []
-- try to make all operations O(1)
-- hint: we can implement a queue using two stacks
