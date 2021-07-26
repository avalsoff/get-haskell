import Control.Monad
import Control.Monad.ST
import Data.Array.ST
import Data.Array.Base

data IntUArr = UArray Int Int

crossover :: (UArray Int Int, UArray Int Int) -> Int -> UArray Int Int
crossover (arr1, arr2) cutoff = runSTUArray $ do
  stArr2 <- thaw arr2
  forM_ [0 .. cutoff] $ \i -> do
    writeArray stArr2 i $ arr1 ! i
  pure stArr2

crossover2 :: (UArray Int Int, UArray Int Int) -> Int -> UArray Int Int
crossover2 (arr1, arr2) cutoff = runSTUArray $ do
  stArr1 <- thaw arr1
  let end = (snd . bounds) arr1
  forM_ [cutoff .. end] $ \i -> do
    writeArray stArr1 i $ arr2 ! i
  pure stArr1
