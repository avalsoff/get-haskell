import System.IO
import System.Environment
import qualified Data.Text as T
import qualified Data.ByteString as B
import qualified Data.Text.Encoding as E

main :: IO ()
main = do
  args <- getArgs
  let path = head args
  file <- B.readFile path
  let text = E.decodeUtf8 file
  print (T.length text - B.length file)

-- नागर्जुन