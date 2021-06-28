reverse' [] = []
reverse' (x:[]) = [x] -- you can match empty rest
reverse' (x:xs) = reverse' xs ++ [x]
