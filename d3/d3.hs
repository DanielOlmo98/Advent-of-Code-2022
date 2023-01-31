import Data.Char (ord)
import Data.Set (Set)
import Data.Set qualified as Set

-- []$|
main :: IO ()
main = do
  input <- readFile "input.txt"
  answer <- pure $ calcPrioritySum1 (lines input)
  print answer
  answer <- pure $ calcPrioritySum2 (lines input)
  print answer

calcPrioritySum1 :: [String] -> Int
calcPrioritySum1 input = sum $ map (getCharValue . head . splitRucksack) input

compartmentsIntersection :: (String, String) -> [Char]
compartmentsIntersection (x, y) = Set.elems (Set.fromList x `Set.intersection` Set.fromList y)

splitRucksack :: String -> [Char]
splitRucksack rucksack = (compartmentsIntersection . splitAt (length rucksack `div` 2)) rucksack

calcPrioritySum2 :: [String] -> Int
calcPrioritySum2 input = sum $ map (getCharValue . head . groupIntersection) (group 3 input)

group :: Int -> [a] -> [[a]]
group _ [] = []
group n list = take n list : group n (drop n list)

groupIntersection :: [String] -> [Char]
groupIntersection groups = Set.elems $ foldl1 Set.intersection $ map Set.fromList groups

getCharValue :: Char -> Int
getCharValue char = head [v | (v, c) <- zip [1 .. 52] (['a' .. 'z'] ++ ['A' .. 'Z']), char == c]
