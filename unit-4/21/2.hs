fastFib :: (Eq a, Num a) => a -> a -> a -> a
fastFib _ _ 0 = 0
fastFib _ _ 1 = 1
fastFib _ _ 2 = 1
fastFib n1 n2 3 = n1 + n2
fastFib n1 n2 counter = fastFib (n1 + n2) n1 (counter - 1)

fib :: Integer -> Integer
fib = fastFib 1 1

main :: IO()
main = do
  putStrLn "Enter N to get Nth fibonacci number"
  n <- getLine
  let intN = read n :: Integer
  putStrLn (mconcat [show intN, "'s fibonacci number is ", show (fib intN)])
