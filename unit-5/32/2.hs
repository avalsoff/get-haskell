monthEnds :: [Int]
monthEnds = [31,28,31,30,31,30,31,31,30,31,30,31]

dates :: [Int] -> [Int]
dates ends = [date | end <- ends, date <- [1 ..end ] ]

datesDo ends = do
  end <- ends
  [1 .. end]

datesM ends = ends >>= (\end -> [1 .. end])
