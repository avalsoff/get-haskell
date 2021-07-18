type Pizza = (Double, Double)

areaGivenDiameter :: Double -> Double
areaGivenDiameter size = pi * (size / 2) ^ 2

costPerInch :: Pizza -> Double
costPerInch (size, cost) = cost / areaGivenDiameter size

comparePizzas :: Pizza -> Pizza -> Pizza
comparePizzas p1 p2 =
  if costP1 < costP2
    then p1
    else p2
  where
    costP1 = costPerInch p1
    costP2 = costPerInch p2

describePizza :: Pizza -> String
describePizza (size, cost) =
  "The " ++ show size ++ " pizza "
    ++ "is cheaper at "
    ++ show costSqInch
    ++ " per square inch"
  where
    costSqInch = costPerInch (size, cost)

listMain :: [String]
listMain = do
  size1 <- [30]
  cost1 <- [300, 400]
  size2 <- [40]
  cost2 <- [400, 300]
  let pizza1 = (size1, cost1)
  let pizza2 = (size2, cost2)
  let betterPizza = comparePizzas pizza1 pizza2
  return (describePizza betterPizza)
