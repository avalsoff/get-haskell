ifEven myFunction x = if even x
  then myFunction x
  else x

ifEvenInc = ifEven (\x -> x + 1)
ifEvenDouble = ifEven (\x -> x * 2)
ifEvenSquare = ifEven (\x -> x ** 2)
