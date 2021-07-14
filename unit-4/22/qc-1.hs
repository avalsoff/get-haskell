main :: IO()
main = do
  lines <- mapM (const getLine) [1..3]
  mapM_ putStrLn lines
