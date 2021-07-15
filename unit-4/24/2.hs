import System.IO
import System.Environment
import qualified Data.Text as T
import qualified Data.Text.IO as TIO

capitalize :: T.Text -> T.Text
capitalize text = T.toUpper firstLetter <> T.tail text
  where firstLetter = T.pack [T.head text]

main :: IO ()
main = do
  args <- getArgs
  let path = head args
  file <- TIO.readFile path
  TIO.writeFile path (capitalize file)
