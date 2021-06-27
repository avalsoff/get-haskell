inFirstHalf list value = value `elem` firstHalf
  where firstHalf = take halfLength list
        halfLength = length list `div` 2
