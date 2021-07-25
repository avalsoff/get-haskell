module Main where

import Data.Aeson
import Data.ByteString.Lazy as B
import Data.ByteString.Lazy.Char8 as BC
import Data.Text as T
import GHC.Generics
import Control.Monad

data Book = Book
  { title :: T.Text,
    author :: T.Text,
    year :: Int
  }
  deriving (Show, Generic)

instance FromJSON Book

instance ToJSON Book

myBook :: Book
myBook =
  Book
    { author = "Will Kurt",
      title = "Learn Haskell",
      year = 2017
    }

myBookJSON :: BC.ByteString
myBookJSON = encode myBook

rawJSON :: BC.ByteString
rawJSON = "{\"author\":\"Emil Ciroan\",\"title\":\"A Short History of Decay\",\"year\":1949}"

bookFromJSON :: Either String Book
bookFromJSON = eitherDecode rawJSON

sampleError :: BC.ByteString
sampleError = "{\"message\":\"oops!\",\"error\": 123}"

data ErrorMessage = ErrorMessage
  { message :: T.Text,
    errorCode :: Int
  }
  deriving (Show)

instance FromJSON ErrorMessage where
  parseJSON (Object v) =
    ErrorMessage <$> v .: "message"
      <*> v .: "error"

instance ToJSON ErrorMessage where
  toJSON (ErrorMessage message errorCode) =
    object ["message" .= message, "error" .= errorCode]

-- data Name = Name
--   { firstName :: T.Text,
--     lastName :: T.Text
--   }
--   deriving (Show)

-- instance FromJSON Name where
--   parseJSON (Object v) =
--     Name <$> v .: "firstName"
--       <*> v .: "lastName"

data NOAAResult = NOAAResult
  { uid :: T.Text,
    mindate :: T.Text,
    maxdate :: T.Text,
    name :: T.Text,
    datacoverage :: Float,
    resultId :: T.Text
  }
  deriving (Show)

instance FromJSON NOAAResult where
  parseJSON (Object v) =
    NOAAResult <$> v .: "uid"
      <*> v .: "mindate"
      <*> v .: "maxdate"
      <*> v .: "name"
      <*> v .: "datacoverage"
      <*> v .: "id"

data Resultset = Resultset
  { offset :: Int,
    count :: Int,
    limit :: Int
  }
  deriving (Show, Generic)

instance FromJSON Resultset

newtype Metadata = Metadata {resultset :: Resultset} deriving (Show, Generic)

instance FromJSON Metadata

data NOAAResponse = NOAAResponse
  { metadata :: Metadata,
    results :: [NOAAResult]
  }
  deriving (Show, Generic)

instance FromJSON NOAAResponse

-- printResults :: [NOAAResult] -> IO ()
-- printResults Nothing = print "error loading data"
printResults :: [NOAAResult] -> IO ()
printResults = Prelude.mapM_ (print . name)

main :: IO ()
main = do
  jsonData <- B.readFile "data.json"
  let noaaResponse = eitherDecode jsonData :: Either String NOAAResponse
  let noaaResults = results <$> noaaResponse
  case noaaResults of
    Left s -> print s
    Right nr -> printResults nr


-- 40.2
data IntList = Cons Int IntList | EmptyList deriving (Show, Generic)
instance ToJSON IntList
-- cons :: Int -> IntList -> IntList
