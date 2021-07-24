module Main where

import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC
import qualified Data.ByteString.Lazy as L
import qualified Data.ByteString.Lazy.Char8 as LC
import Network.HTTP.Simple
import Network.HTTP.Types.Status

token :: BC.ByteString
token = "nxIyzhraFIMdMYGccOQVKYANwDijQTmv"

noaaHost :: BC.ByteString
noaaHost = "www.ncdc.noaa.gov"

apiPath :: BC.ByteString
apiPath = "/cdo-web/api/v2/datasets"

buildRequest :: BC.ByteString -> BC.ByteString -> BC.ByteString
  -> BC.ByteString -> Request
buildRequest token host method path = setRequestMethod method
  $ setRequestHost host
  $ setRequestHeader "token" [token]
  $ setRequestPath path
  $ setRequestSecure True
  $ setRequestPort 443
  $ defaultRequest

request :: Request
request = buildRequest token noaaHost "GET" apiPath

main :: IO ()
main = do
  response <- httpLBS request
  let status = getResponseStatusCode response
  if status == 200
    then do
      print "Saving request body to a file..."
      let jsonBody = getResponseBody response
      L.writeFile "data.json" jsonBody
    else do
      print $ statusMessage $ getResponseStatus response






-- header :: (Data.String.IsString (f http-types-0.12.3:Network.HTTP.Types.Header.HeaderName), Control.Monad.IO.Class.MonadIO f) => f [Data.ByteString.Internal.ByteString]

path :: Request
path = "http://news.ycombinator.com"

response :: IO (Response LC.ByteString)
response = httpLBS path

header = getResponseHeader "Content-Type" <$> response
-- show <$> header
