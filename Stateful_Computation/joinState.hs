-- implement function 

newtype State s a =
    State { runState :: s -> (a, s) }

joinState:: State s (State s a) -> State s a
joinState (State h) = State $ \s ->
    let (State g, s') = h s
    in g s'
