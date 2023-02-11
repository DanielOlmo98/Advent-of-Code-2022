main :: IO ()
main = do
  input <- readFile "input.txt"
  let answer = calcTotalOverlaps (lines input)
  print answer
  let answer = calcTotalOverlaps' (lines input)
  print answer
