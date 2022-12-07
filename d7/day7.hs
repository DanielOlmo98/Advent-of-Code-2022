import Data.Tree

type Filesystem = [Folder]

data Folder = Folder {folder_name :: String, files :: Maybe [File], folders :: Maybe [Folder]}

data File = File {file_name :: String, size :: Maybe Int}

main :: IO ()
main = do
  input <- readFile "input.txt"
  print "main"
  let r = File "aaaaa" (Just 12)
  putStrLn (file_name r)
  print (size r)

-- answer <- ? input1
-- print answer
