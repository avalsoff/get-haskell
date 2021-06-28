myTake 0 list = []
myTake n [] = []
myTake n (x:xs) = x:(myTake (n - 1) xs)
