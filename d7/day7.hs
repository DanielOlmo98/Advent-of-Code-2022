{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Eta reduce" #-}
import Data.Tree
import Distribution.Simple.Command (commandsRun)
import GHC.IO.Encoding (argvEncoding)

data Folder = Folder {folder_name :: String, files :: [File], folders :: [Folder]} deriving (Show)

data File = File {file_name :: String, size :: Int} deriving (Show)

sumFileSizes :: [File] -> Int
sumFileSizes = sum . map size

getFolderSize :: Folder -> Int
getFolderSize folder = sumFileSizes (files folder) + sum (map getFolderSize (folders folder))

addFolder :: Folder -> Folder -> Folder
addFolder parentFolder childFolder = parentFolder {folders = childFolder : folders parentFolder}

addFile :: Folder -> File -> Folder
addFile parentFolder newFile = parentFolder {files = newFile : files parentFolder}

parseCommands :: [String] -> Folder -> Folder -> Folder
parseCommands [] current_folder root_folder = addFolder root_folder current_folder
parseCommands (command : commands_tail) current_folder root_folder =
  let next_folder
        | command == "$ cd /" = root_folder
        | command == "$ cd .." = current_folder
        | take 4 command == "$ cd" = parseCD (drop 3 command) current_folder
        | take 4 command == "$ ls" = parseLS (map words (takeWhile ((/= '$') . head) commands_tail)) current_folder
        | otherwise = current_folder
   in parseCommands commands_tail next_folder root_folder

parseLS :: [[String]] -> Folder -> Folder
parseLS folder_contents current_folder = foldr parse current_folder folder_contents
  where
    parse [size, name] folder
      | size == "dir" = addFolder folder (Folder name [] [])
      | otherwise = addFile folder (File name (read size :: Int))

parseCD :: String -> Folder -> Folder
parseCD folder_name current_folder = Folder folder_name [] []

main :: IO ()
main = do
  input <- readFile "input.txt"
  let rootfolder = Folder "/" [] []
  answer <- pure $ getFolderSize $ parseCommands (lines input) rootfolder rootfolder
  print answer

-- answer <- ? input1
-- print answer
