{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Eta reduce" #-}
import Data.Tree
import Distribution.Simple.Command (commandsRun)

data Folder = Folder {folder_name :: String, files :: [File], folders :: [Folder]}

data File = File {file_name :: String, size :: Int}

sumFileSizes :: [File] -> Int
sumFileSizes files = foldl (\current_sum next_file -> current_sum + size next_file) 0 files

getFolderSize :: Folder -> Int
getFolderSize folder = sumFileSizes (files folder) + foldl (\sum f -> sum + getFolderSize f) 0 (folders folder)

addFolder :: Folder -> Folder -> Folder
addFolder parentFolder childFolder = parentFolder {folders = childFolder : folders parentFolder}

addFile :: Folder -> File -> Folder
addFile parentFolder newFile = parentFolder {files = newFile : files parentFolder}

-- parseInput :: String -> Folder
-- parseInput lines input

parseCommands :: [String] -> Folder
parseCommands commands
  | command 




main :: IO ()
main = do
  input <- readFile "input.txt"
  print "main"
  let filesystem = Folder "\\" [File "cock.xd" 13] [Folder "benis" [] []]
  let f1 = File "aaaaa.cock" 12
  putStrLn (file_name f1)
  print (size f1)

-- answer <- ? input1
-- print answer
