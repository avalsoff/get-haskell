import System.IO
import System.Environment
import qualified Data.Text as T
import qualified Data.Text.IO as TIO

main :: IO()
main = do
  args <- getArgs
  let path = head args
  file <- TIO.readFile path
  TIO.writeFile (path ++ "_") file
