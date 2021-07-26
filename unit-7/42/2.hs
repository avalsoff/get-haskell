import Control.Monad
import Control.Monad.ST
import Data.Array.ST
import Data.Array.Base

replaceZeros :: UArray Int Int -> UArray Int Int
replaceZeros array = runSTUArray $ do
  result <- thaw array
  let end = (snd . bounds) array
  forM_ [0 .. end] $ \i -> do
    val <- readArray result i
    when (val == 0) $ do
      writeArray result i (-1)
  pure result
