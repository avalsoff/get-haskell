toInts :: String -> [Integer]
toInts = map read . lines

main :: IO ()
main = do
  userInput <- getContents
  let numbers = toInts userInput
  let sumOfSquares = sum . map (^2)
  print (sumOfSquares numbers)
