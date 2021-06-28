map' _ [] = []
map' fn (x:[]) = [fn x]
map' fn (x:xs) = (fn x):(map' fn xs)
