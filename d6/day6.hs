import Data.List (findIndex, nub, tails)

windows :: Int -> [a] -> [[a]]
windows n xs = map (take n) (tails xs)

isUnique :: Eq a => [a] -> Bool
isUnique win = length win == length (nub win)

getMarkerStart :: Int -> [Char] -> Int
getMarkerStart n stream = length $ takeWhile (not . isUnique) (windows n stream)

getPacketStart :: Int -> FilePath -> IO Int
getPacketStart n path = do
  input <- readFile path
  pure $ n + getMarkerStart n input

main :: IO ()
main = do
  answer <- getPacketStart 4 "bigboy.txt"
  print answer
  answer <- getPacketStart 14 "bigboy.txt"
  print answer
