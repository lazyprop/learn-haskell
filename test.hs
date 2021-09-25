double x = x + x

quadruple x = double (double x)

-- average ns = div (sum ns) (length ns)
average ns = sum ns `div` length ns -- it's more natural to write div in the middle

factorial n = product [1..n]

n = a `div` length xs
  where
      a = 10
      xs = [1, 2, 3, 4, 5]

last' (x:[]) = x
last' (x:xs) = last' xs

init' (x:[]) = []
init' (x:xs) = [x] ++ init' xs

testList = [1, 2, 3, 4, 5]
