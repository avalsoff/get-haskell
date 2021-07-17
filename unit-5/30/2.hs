allApp :: Monad m => m (a -> b) -> m a -> m b
allApp funcM monad = do
  func <- funcM
  a <- monad
  return $ func a

allApp2 :: Monad m => m (a -> b) -> m a -> m b
allApp2 func val = func >>= (\f -> val >>= (\x -> return (f x)))

allApp3 :: Monad m => m (a -> b) -> m a -> m b
allApp3 func val = func >>= (<$> val)
