import qualified Data.Map as Map

helloPerson :: String -> String
helloPerson name = "Hello" ++ " " ++ name ++ "!"

nameMap :: Map.Map Int String
nameMap = Map.fromList [(1, "Vyacheslav")]

maybeMain :: Maybe String
maybeMain = do
  -- show "Hello! What's your name?"
  name <- Map.lookup 1 nameMap
  let statement = helloPerson name
  return statement
