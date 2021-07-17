lastNightBeerVariants = [6, 12]
beersWeDrunk = 4
willComeTodayVariants = (+2) <$> [2, 3]
beersPerGuestVariants = [3, 4]

beersLeftVariants = (-) <$> lastNightBeerVariants <*> pure beersWeDrunk
beersNeeded = (*) <$> willComeTodayVariants <*> beersPerGuestVariants
weShouldBuyVariants :: [Integer]
weShouldBuyVariants = (-) <$> beersNeeded <*> beersLeftVariants
weShouldBuy :: Integer
weShouldBuy = maximum weShouldBuyVariants
