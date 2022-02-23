-- evaluation order
-- haskell is lazily evaluated unlike scheme

sub1 :: (Num a) => a -> a
sub1 n = n - 1

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (sub1 n)

-- the following probably doesn't compile

factorial 5
5 * factorial (sub1 5)
5 * (sub1 5) * factorial (sub1 (sub1 5))
5 * (sub1 5) * (sub1 (sub1 5)) factorial (sub1 (sub1 (sub1 5)))
-- ...

