-- a first template for IO in competitive programming

import Control.Monad
import Data.List

spaceSeperate :: [String] -> String
spaceSeperate = foldr (++) "" . intersperse " "

-- read space separated integers into a list
readNums :: IO [Int]
readNums = do
    line <- getLine
    return (map read $ words line :: [Int])

main :: IO ()
main = do
    -- testcases
    t <- readLn     -- readLn is basically (read . getLine)
    replicateM t $ do
        -- each testcase
        ns <- readNums
        putStrLn "numbers:"
        print ns
        putStrLn "space seperated again:"
        putStrLn $ spaceSeperate $ map show ns
    return ()


solve :: Int -> Int
solve = id
