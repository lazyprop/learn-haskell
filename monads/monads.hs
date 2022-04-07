import ST

data Expr = Val Int | Div Expr Expr

safediv :: Int -> Int -> Maybe Int
safediv _ 0 = Nothing
safediv x y = Just (x `div` y)

eval :: Expr -> Maybe Int
eval (Val x)  = Just x
eval (Div x y) = do
    n <- eval x
    m <- eval y
    safediv n m


pairs0 :: [a] -> [b] -> [(a, b)]
pairs0 xs ys = [(x, y) | x <- xs, y <- ys]

pairs1 :: [a] -> [b] -> [(a, b)]
pairs1 xs ys = xs >>= \x -> [(x, y) | y <- ys]

pairs2 :: [a] -> [b] -> [(a, b)]
pairs2 xs ys = xs >>= \x -> ys >>= \y -> [(x, y)]




-- tree relabeling example
