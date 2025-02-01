
join :: ([a], [a]) -> [a]
join ([], ys) = ys
join (x:xs, ys) = x : join (xs, ys)