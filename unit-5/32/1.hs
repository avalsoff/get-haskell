monthEnds :: [Int]
monthEnds = [31,28,31,30,31,30,31,31,30,31,30,31]
dates :: [Int] -> [Int]
dates ends = [date | end <- ends, date <- [1 ..end ] ]
