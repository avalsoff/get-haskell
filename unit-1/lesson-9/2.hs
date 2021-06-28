import Data.Char (toLower)

isPalindrome str = noCapitalsAndSpaces == reverse noCapitalsAndSpaces
  where noSpaces = filter (/= ' ') str
        noCapitalsAndSpaces = map toLower noSpaces
