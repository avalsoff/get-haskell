succ' :: Enum a => a -> Either String a
succ' n
  | fromEnum n >= (maxBound :: Int) = Left "Argument should be less than upper bound"
  | fromEnum n < minBound = Left "Argument should be more or equal to lower bound"
  | otherwise = Right $ toEnum $ (fromEnum n) + 1

tail' [] = []
tail' (x:xs) = xs

safeLast :: [a] -> Either String a
safeLast [] = Left "Emplty list"
safeLast xs = safeLast' 10000 xs

safeLast' :: Int -> [a] -> Either String a
safeLast' _ [] = Left "Emplty list"
safeLast' 0 _ = Left "List exceeds safe bound"
safeLast' _ [x] = Right x
safeLast' n (x:xs) = safeLast' (n - 1) xs
