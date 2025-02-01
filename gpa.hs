-- write function gpa that computes grade-point average from a given list of letter grades
-- what's the type of gpa?
-- assume that possible grades are A, B+, B, C+, C, D+, D, F, W (W grades don't count)
-- assume (for now) that every course has the same credits
-- be sure to write small but reusable units of code


gradeToScore ::Fractional a => String -> a
gradeToScore grade = case grade of
    "A"  -> 4.0
    "B+" -> 3.5
    "B"  -> 3.0 
    "C+" -> 2.5
    "C"  -> 2.0
    "D+" -> 1.5
    "D"  -> 1.0
    "F"  -> 0.0
    "W"  -> -1.0
    _    -> error "impossible grades"

gpa :: (Fractional a, Ord a) => [String] -> a
gpa xs = averageGPA $ filter (0.0 <=) $ map gradeToScore xs
    where
        averageGPA scores  = sum $ map ( / (sum [1.0 | _ <- scores ])) scores 
