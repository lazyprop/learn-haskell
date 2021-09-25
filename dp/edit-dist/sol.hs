import Data.Array

naive :: String -> String -> Int
naive a b
  | a == ""   = length b
  | b == ""   = length a
  | (head a) == (head b) = naive (tail a) (tail b)
  | otherwise = minimum [ naive (tail a) b        + 1
                        , naive a (tail b)        + 1
                        , naive (tail a) (tail b) + 1
                        ]

lazy :: String -> String -> Int
lazy a b = d n m
  where
    n  = length a
    m  = length b
    a' = listArray (1, n) a
    b' = listArray (1, m) b

    d i 0 = i
    d 0 j = j
    d i j
      | (a' ! i) == (b' ! j) = ds ! (i - 1, j - 1)
      | otherwise = minimum [ d (i - 1) j         + 1
                            , d i (j - 1)         + 1
                            , d (i - 1) (j - 1)   + 1
                            ]

    ds = listArray bounds [d i j | (i, j) <- range bounds]
    bounds = ((0, 0), (n, m))

loop 0 _ = return ()
loop n action = do
  action
  loop (n - 1) action

main = do
  line <- getLine
  let tests = read line :: Int
  loop tests $ do
    a <- getLine
    b <- getLine
    print (lazy a b)
