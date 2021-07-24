import Data.Char

addStrInts :: String -> String -> Either String Int
addStrInts str1 str2 =
  if not isStr1Int then Left "First arguments is not Int"
    else if not isStr2Int then Left "Second argument is not Int"
      else Right $ read str1 + read str2
  where isStr1Int = all isDigit str1
        isStr2Int = all isDigit str2

addStrInts2 :: String -> String -> Either String Int
addStrInts2 str1 str2
  | not (all isDigit str1) = Left "First arguments is not Int"
  | not (all isDigit str2) = Left "Second arguments is not Int"
  | otherwise = Right $ read str2 + read str1
