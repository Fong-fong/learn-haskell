
type Queue  a = ([a], [a], Int)



--จากชั้นเรียน เราทราบว่าเราสามารถ implement Queue เป็น stateful computation ได้ ในข้อนี้ เราจะ implement Circular Singly Linked List เป็น stateful computation ใน ในภาษา Haskell โดย ที่แต่ละ node ของ Circular Singly Linked List  มีตัวถัดไปเพียงตัวเดียว เท่านั้น ตัวถัดไปของ node สุดท้ายจะเป็น node แรกสุดของ Circular Singly Linked List ส่งผลให้เกิดวงกลมขึ้น เราสามารถย้าย node ได้ในทิศทางเดียวเท่านั้น

-- นิยาม data type สําหรับ Circular Singly Linked List ในข้อนี้จะย่อเป็น Circular List
newtype State s a =
    State { runState :: s -> (a, s) }
type CircularList  a = ([a], [a], Int)


-- Implement operation size ที่จะคืนค่าขนาดของ Circular List โดยมี data type เป็น \cd{size :: State (CircularList a) Int}
size :: State (CircularList a) Int
size = State $ \cl@(_, _, sz) -> (sz, cl)


-- Implement operation isEmpty ที่จะบอกว่า Circular List ว่างหรือไม่ โดยมี data type เป็น \cd{isEmpty :: State (CircularList a) Bool}
isEmpty :: State (CircularList a) Bool
isEmpty = State $ \cl@(_, _, sz) -> (sz == 0, cl)


-- Implement operation add ที่จะเพิ่ม node ใหม่ เป็น node ก่อนหน้าของ node ปัจจุบัน โดยมี data type เป็น \cd{add :: a->State (CircularList a) ()}

add :: a->State (CircularList a) ()
add x = State $ \(hd, tl, sz) ->
  ((), (hd, x:tl, sz+1))

-- Implement operation move ที่จะย้าย node ปัจจุบัน เป็น node ถัดไปของ node ปัจจุบัน โดยมี data type เป็น \cd{move :: State (CircularList a) ()}

move :: State (CircularList a) ()
move = State $ \(hd, tl, sz) ->
  case hd of
    [] -> let newHd = reverse tl
      in case newHd of
        [] -> ((),(hd, tl, sz))
        x:xs-> ((), (xs, [x], sz))
    x:xs -> ((), (xs, x:tl, sz))

-- Implement operation pop ที่จะย้าย node ปัจจุบัน เป็น node ถัดไปของ node ปัจจุบัน และนำ node ปัจจุบันออก แล้วคืนค่าของ node ที่ถูกนำออก โดยมี data type เป็น \cd{pop :: State (CircularList a) (Maybe a)}


pop :: State (CircularList a) (Maybe a)
pop = State $ \(hd, tl, sz) ->
  case hd of
    [] -> let newHd = reverse tl
      in case newHd of
        [] -> (Nothing,(hd, tl, sz))
        x:xs-> (Just x, (xs, [], sz-1))
    x:xs -> (Just x, (xs, tl, sz-1))

-- Implement operation top ที่จะคืนค่าของ node ปัจจุบันโดยมี data type เป็น \cd{top :: State (CircularList a) (Maybe a)}


top :: State (CircularList a) (Maybe a)
top = State $ \(hd, tl, sz) ->
  case hd of
    [] -> let newHd = reverse tl
      in case newHd of
        [] -> (Nothing,(hd, tl, sz))
        x:xs -> (Just x, (x:xs, [], sz))
    x:_ -> (Just x, (hd, tl, sz))


-- Implement operation mkCircularList ที่จะ นำ list ที่รับมา มาสร้าง Circular List โดยมี data type เป็น \cd{mkCircularList :: [a] -> State (CircularList a) ()}

mkCircularList :: [a] -> State (CircularList a) ()
mkCircularList l = State $ \_ -> ((), (l, [], length l))

-- Implement operation empty ที่จะสร้าง Circular List ว่าง โดยมี data type เป็น \cd{empty :: State (CircularList a) ()}

empty :: State (CircularList a) ()
empty = mkCircularList []



-- \cd{ Supasan's problem ,Circular Singly Linked List}

-- จากชั้นเรียน เราทราบว่าเราสามารถ implement Queue เป็น stateful computation ได้ ในข้อนี้ เราจะ implement Circular Singly Linked List เป็น stateful computation ใน ในภาษา Haskell โดย ที่แต่ละ node ของ Circular Singly Linked List  มีตัวถัดไปเพียงตัวเดียว เท่านั้น ตัวถัดไปของ node สุดท้ายจะเป็น node แรกสุดของ Circular Singly Linked List ส่งผลให้เกิดวงกลมขึ้น เราสามารถย้าย node ได้ในทิศทางเดียวเท่านั้น

-- นิยาม data type สําหรับ Circular Singly Linked List ในข้อนี้จะย่อเป็น Circular List

-- \begin{lstlisting}
-- newtype State s a =
--     State { runState :: s -> (a, s) }
-- type CircularList  a = ([a], [a], Int)
-- \end{lstlisting}


-- \[1 คนแนน\]  Implement operation size ที่จะคืนค่าขนาดของ Circular List โดยมี data type เป็น \cd{size :: State (CircularList a) Int}
-- \begin{answer}{3}
-- \begin{lstlisting}
-- size :: State (CircularList a) Int
-- size = State $ \cl@(_, _, sz) -> (sz, cl)
-- \end{lstlisting}
-- \end{answer}


-- \[1 คนแนน\]  Implement operation isEmpty ที่จะบอกว่า Circular List ว่างหรือไม่ โดยมี data type เป็น \cd{isEmpty :: State (CircularList a) Bool}
-- \begin{answer}{3}
-- \begin{lstlisting}
-- isEmpty :: State (CircularList a) Bool
-- isEmpty = State $ \cl@(_, _, sz) -> (sz == 0, cl)
-- \end{lstlisting}
-- \end{answer}


-- \[1 คนแนน\]  Implement operation add ที่จะเพิ่ม node ใหม่ เป็น node ก่อนหน้าของ node ปัจจุบัน โดยมี data type เป็น \cd{add :: a->State (CircularList a) ()}
-- \begin{answer}{3}
-- \begin{lstlisting}
-- add :: a->State (CircularList a) ()
-- add x = State $ \(hd, tl, sz) ->
--   ((), (hd, x:tl, sz+1))
-- \end{lstlisting}
-- \end{answer}

-- \[1 คนแนน\]  Implement operation move ที่จะย้าย node ปัจจุบัน เป็น node ถัดไปของ node ปัจจุบัน โดยมี data type เป็น \cd{move :: State (CircularList a) ()}
-- \begin{answer}{8}
-- \begin{lstlisting}
-- move :: State (CircularList a) ()
-- move = State $ \(hd, tl, sz) ->
--   case hd of
--     [] -> let newHd = reverse tl
--       in case newHd of
--         [] -> ((),(hd, tl, sz))
--         x:xs-> ((), (xs, [x], sz))
--     x:xs -> ((), (xs, x:tl, sz))
-- \end{lstlisting}
-- \end{answer}

-- \[1 คนแนน\]  Implement operation pop ที่จะย้าย node ปัจจุบัน เป็น node ถัดไปของ node ปัจจุบัน และนำ node ปัจจุบันออก แล้วคืนค่าของ node ที่ถูกนำออก โดยมี data type เป็น \cd{pop :: State (CircularList a) (Maybe a)}
-- \begin{answer}{8}
-- \begin{lstlisting}
-- pop :: State (CircularList a) (Maybe a)
-- pop = State $ \(hd, tl, sz) ->
--   case hd of
--     [] -> let newHd = reverse tl
--       in case newHd of
--         [] -> (Nothing,(hd, tl, sz))
--         x:xs-> (Just x, (xs, [], sz-1))
--     x:xs -> (Just x, (xs, tl, sz-1))
-- \end{lstlisting}
-- \end{answer}

-- \[1 คนแนน\]  Implement operation top ที่จะคืนค่าของ node ปัจจุบันโดยมี data type เป็น \cd{top :: State (CircularList a) (Maybe a)}
-- \begin{answer}{8}
-- \end{answer}
-- \begin{lstlisting}
-- top :: State (CircularList a) (Maybe a)
-- top = State $ \(hd, tl, sz) ->
--   case hd of
--     [] -> let newHd = reverse tl
--       in case newHd of
--         [] -> (Nothing,(hd, tl, sz))
--         x:xs -> (Just x, (x:xs, [], sz))
--     x:_ -> (Just x, (hd, tl, sz))
-- \end{lstlisting}


-- \[1 คนแนน\]  Implement operation mkCircularList ที่จะ นำ list ที่รับมา มาสร้าง Circular List โดยมี data type เป็น \cd{mkCircularList :: [a] -> State (CircularList a) ()}
-- \begin{answer}{3}
-- \begin{lstlisting}
-- mkCircularList :: [a] -> State (CircularList a) ()
-- mkCircularList l = State $ \_ -> ((), (l, [], length l))
-- \end{lstlisting}
-- \end{answer}

-- \[1 คนแนน\]   Implement operation empty ที่จะสร้าง Circular List ว่าง โดยมี data type เป็น \cd{empty :: State (CircularList a) ()}
-- \begin{answer}{3}
-- \begin{lstlisting}
-- empty :: State (CircularList a) ()
-- empty = mkCircularList []
-- \end{lstlisting}
-- \end{answer}