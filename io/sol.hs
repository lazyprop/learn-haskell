import Data.Maybe

getHalf :: Char -> Char
getHalf c
  | c == 'L' || c == 'R'  = c
  | c == 'U'              = 'D'
  | c == 'D'              = 'U'

solve = do
  n <- readLnInt
  row <- getLine
  putStrLn (map getHalf row)

loop 0 _ = return ()
loop n action = do
  action
  loop (n - 1) action

readLnInt :: IO Int
readLnInt = readLn :: IO Int

main = do
  tests <- readLnInt
  loop tests $ do
    solve

