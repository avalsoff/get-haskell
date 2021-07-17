allFmapM :: Monad m => (a -> b) -> m a -> m b
allFmapM func monad = monad >>= newFunc
  where newFunc = return . func
