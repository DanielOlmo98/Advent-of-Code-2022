import Data.Set (Set)
import Data.Set qualified as Set

main :: IO ()
main = do
  input <- readFile "input.txt"
  let answer = calcTotalOverlaps (lines input)
  print answer
  let answer = calcTotalOverlaps' (lines input)
  print answer

calcTotalOverlaps :: [String] -> Int
calcTotalOverlaps input = sum $ map (fromEnum . compareSectionsSubset . checkOverlap) input

calcTotalOverlaps' :: [String] -> Int
calcTotalOverlaps' input = sum $ map (fromEnum . compareSectionsUnion . checkOverlap) input

splitLine :: String -> [String]
splitLine [] = [""]
splitLine (c : cs)
  | c == ',' = "" : rest
  | c == '-' = "" : rest
  | otherwise = (c : head rest) : tail rest
  where
    rest = splitLine cs

checkOverlap :: String -> [Int]
checkOverlap line = map read (splitLine line)

compareSectionsSubset :: [Int] -> Bool
compareSectionsSubset (x1 : x2 : y1 : y2 : _) = x1 >= y1 && x2 <= y2 || y1 >= x1 && y2 <= x2

compareSectionsUnion :: [Int] -> Bool
compareSectionsUnion (x1 : x2 : y1 : y2 : _) = not . null $ Set.fromList [x1 .. x2] `Set.intersection` Set.fromList [y1 .. y2]

-- [] $ |
