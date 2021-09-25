fastfib :: Integer -> Integer -> Integer -> Integer
fastfib a b n
  | n == 0    = a
  | otherwise = fastfib b (a+b) (n-1)

fib :: Integer -> Integer
fib n = fastfib 0 1 n

main :: IO()
main = do
  line <- getLine
  let n = read line :: Integer
  print $ fib n
