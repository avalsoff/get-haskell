echo :: IO ()
echo = getLine >>= putStrLn

echo2 :: IO ()
echo2 = do
  line <- getLine
  putStrLn line
