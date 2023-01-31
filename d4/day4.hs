main :: IO ()
main = do
  input <- readFile "input.txt"
  answer <- pure $ solution (lines input)
  print answer
