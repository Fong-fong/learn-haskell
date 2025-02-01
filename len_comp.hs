len_comp :: Num b => [a] -> b
len_comp xs = sum [1| _<-xs]