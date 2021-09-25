-- if function f has the type
-- f :: A -> B

-- and expressoin e has the type
-- e :: A

-- then the application (f e) has the type
-- f e :: B

-- if the types do not match, a type error is thrown

-- this expression will fail on type grounds
-- weirdBoolCircuit = if True then 1 else False

-- exercises

add :: Int -> Int -> Int -> Int
add a b c = a + b + c

copy :: a -> (a, a)
copy x = (x, x)

swap :: (a, b) -> (b, a)
swap (x, y) = (y, x)

apply :: (a -> b) -> a -> b
apply f x = f x

palindrome :: Eq a => [a] -> Bool
palindrome xs = reverse xs == xs

twice :: (a -> a) -> a -> a
twice f x = f (f x)
