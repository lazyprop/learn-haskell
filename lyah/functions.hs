lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY!"
lucky x = "go home"

first :: [a] -> a
first [] = error "can't call first on empty list"
first (x:_) = x
