euclidGCD a b = if remainder == 0
  then b
  else euclidGCD b remainder
  where remainder = a `mod` b
