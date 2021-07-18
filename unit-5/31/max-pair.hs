import Data.Maybe

maxPairM :: (Monad m, Ord a) => m (a,a) -> m a
maxPairM monad = monad >>= \(a1, a2) -> return (max a1 a2)

maxPairM2 :: (Monad m, Ord b) => m (b, b) -> m b
maxPairM2 monad = do
  (a1, a2) <- monad
  return (max a1 a2)
