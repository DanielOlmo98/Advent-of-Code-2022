-- |
import Data.Function (on)
import Data.List (groupBy)

quickSort [] = []
quickSort (list_1st:list_tail) = quickSort left_side ++ [list_1st] ++ quickSort right_side
                             where
                                left_side  = [a | a <- list_tail, a <= list_1st]
                                right_side = [b | b <- list_tail, b >  list_1st]

reverseQuickSort [] = []
reverseQuickSort (list_1st:list_tail) = reverseQuickSort left_side ++ [list_1st] ++ reverseQuickSort right_side
                             where
                                left_side  = [a | a <- list_tail, a >= list_1st]
                                right_side = [b | b <- list_tail, b <  list_1st]

f :: [String] -> [Int]
f = map read

groupElfInvs :: String -> [[Int]]
groupElfInvs = map f
             . filter(not . any null)
             . groupBy ((==) `on` null)
             . lines

getInvs :: FilePath -> IO [Int]
getInvs path = do
  input <- readFile path
  pure $ sumSortInvs (groupElfInvs input)

sumSortInvs :: [[Int]] -> [Int]
sumSortInvs invs = reverseQuickSort (map sum invs)

top3Invs :: [Int] -> Int
top3Invs invs = sum $ take 3 invs

main :: IO ()
main = do
  invs <- getInvs "input.txt"
  print "Top 1"
  print $ take 1 invs
  print "Sum top 3"
  print $ top3Invs invs
  -- print invs
