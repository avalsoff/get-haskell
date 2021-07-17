example :: Maybe Int 
example = pure (*) <*> (pure(+) <*> (pure 2) <*> (pure 4)) <*> (pure 6)

example2 :: Maybe Int
example2 = pure ((*) ((+) 2 4) 6)
