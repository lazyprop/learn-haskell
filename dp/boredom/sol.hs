import Data.Array

naive :: [Int] -> Integer
naive arr = d (maximum arr)
  where
    count i = length . filter (i==)
    freq i = toInteger (count i arr)
    
    d :: Int -> Integer
    d 0 = 0
    d i
      | i `elem` arr = maximum [ d (i - 1)
                               , d (i - 2) + (freq i) * (toInteger i)
                               ]
      | otherwise    = 0

test1 = naive [1, 2]
test2 = naive [1, 2, 3]
test3 = naive [1, 2, 1, 3, 2, 2, 2, 2, 3]
