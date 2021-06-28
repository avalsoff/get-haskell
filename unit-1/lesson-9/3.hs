harmonic n = foldl (+) 0 (take n ratios)
  where numbers = zip (cycle [1]) [1..]
        ratios = map (\(a,b) -> a / b) numbers
