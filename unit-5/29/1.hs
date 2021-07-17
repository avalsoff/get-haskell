allFmap :: Applicative f => (a -> b) -> f a -> f b
allFmap func app = (pure func) <*> app
