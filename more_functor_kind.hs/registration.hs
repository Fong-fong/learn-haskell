
--course registration code is wrong
--find a bug (give a test case), and give a fix


type CourseID = Int
type Capacity = Int
type StudentID = Int

data CourseInfo = Course
  { cid :: CourseID
  , cap :: Capacity
  , roster :: [StudentID]
  } deriving (Show)

enroll :: CourseInfo -> StudentID ->
        Either String CourseInfo
enroll c sid
  | sid `elem` rs =
      Left "student already registerOld"
  | length rs >= seats =
      Left "course full"
  | otherwise = Right $
      Course (cid c) seats (sid:rs)
  where seats = cap c
        rs = roster c


registerOld :: [CourseInfo]
    -> CourseID -> StudentID
    -> Either String [CourseInfo]
registerOld [] _ _ = Left "no such course"
registerOld (c : cs) cid' sid
  | cid c == cid' =
      case enroll c sid of
        Left msg -> Left msg
        Right c' -> Right (c' : cs)
  | otherwise = registerOld cs cid' sid

--Old version of register function Bug: When register not first course in the list, it not return any course before the course that we want to register


register' :: [CourseInfo]
    -> CourseID -> StudentID
    -> Either String [CourseInfo]
register' [] _ _ = Left "no such course"
register' (c : cs) cid' sid
  | cid c == cid' =
      case enroll c sid of
        Left msg -> Left msg
        Right c' -> Right (c' : cs)
  | otherwise = case register' cs cid' sid of
      Left msg -> Left msg
      Right cs' -> Right (c : cs')



regMock:: [CourseInfo]
regMock = [Course 261216 100 [600610717],
  Course 261218 90
      [600610738, 600610747],
  Course 261409 70
      [600610754,
       600610777,
       600610783],
  Course 261406 2
      [600610752, 600610764]]




--test case the length of list of CourseInfo before registration in the second Course  is equal to the length of list of CourseInfo after registration

testcase ::([CourseInfo]
    -> CourseID -> StudentID
    -> Either String [CourseInfo])-> [CourseInfo] -> Bool
testcase f reg = length reg == length (case f reg 261218 600610748 of
  Left _ -> reg
  Right reg' -> reg')


resultOld :: Bool
resultOld = testcase registerOld regMock


resultNew :: Bool
resultNew = testcase register' regMock