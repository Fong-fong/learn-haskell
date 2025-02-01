-- list.hs <-- this line is a comment
len [] = 0
len ( x:xs) = 1 + len xs

join :: ([a], [a]) -> [a]
join ([], ys) = ys
join (x:xs, ys) = x : join (xs, ys)