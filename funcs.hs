even' :: Integral a => a -> Bool
even' n = n `mod` 2 == 0

splitAt' :: Int -> [a] -> ([a], [a])
splitAt' n xs = (take n xs, drop n xs)

abs' :: Int -> Int
abs' n
  | n >= 0      = n
  | otherwise   = -n

signum' :: Int -> Int
signum' n
  | n < 0       = -1
  | n > 0       = 1
  | otherwise   = 0

lambda_add :: Int -> (Int -> Int)
lambda_add = \x -> (\y -> x + y)

-- return the first n odd integers
odds :: Int -> [Int]
odds n = map (\x -> x*2 + 1) [0..n-1]

halve :: [a] -> ([a], [a])
halve xs = splitAt (length xs `quot` 2) xs

third :: [a] -> a
--third xs = head (tail (tail xs))
--third xs = xs !! 2
third (_:_:x:xs) = x

testlist = [1, 2, 3, 4, 5, 6]

safetail :: [a] -> [a]
--safetail (x:xs) = if null (x:xs) then [] else xs

--safetail (x:xs)
--  | null (x:xs) = []
--  | otherwise   = xs

safetail []     = []
safetail (x:xs) = xs

(||#) :: Bool -> Bool -> Bool
--True ||# True = True
--True ||# False = True
--False ||# True = True
--False ||# False = False

--False ||# False = False
--_ ||# _         = True

--False ||# b = b
--True ||# b  = True

b ||# c
  | b == c      = b
  | otherwise   = True


(&&#) :: Bool -> Bool -> Bool
a &&# b = if a then if b then True else False else False

mult :: Int -> Int -> Int -> Int
mult = \x -> \y -> \z -> x*y*z

luhnDouble :: Int -> Int
luhnDouble n = if x > 9 then x - 9 else x
  where
      x = 2*n

luhn :: Int -> Int -> Int -> Int -> Bool
luhn a b c d = (x + y + z + w) `mod` 10 == 0
  where
      x = luhnDouble a
      y = luhnDouble b
      z = luhnDouble c
      w = luhnDouble d
