myReplicateM n action = mapM (const action) [1 .. n]

main :: IO ()
main = do
  lines <- myReplicateM 4 getLine
  mapM_ putStrLn lines
