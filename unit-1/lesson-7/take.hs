take2 n list = if n <= 0 || length list == 0 then []
  else [head list] ++ (take2 (n - 1) (tail list))

take3 n list = if n <= 0 || length list == 0 then []
  else (list !! 0):(take3 (n - 1) (tail list))

