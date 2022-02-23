-- problem 1

data Tree a = Leaf a | Node (Tree a) a (Tree a)
    deriving Show

instance Functor Tree where
    -- fmap :: (a -> b) -> Tree a -> Tree b
    fmap g (Leaf x)     = Leaf (g x)
    fmap g (Node l x r) = Node (fmap g l) (g x) (fmap g r)


-- problem 2
-- commented out because of duplicate instance declaration

{-
instance Functor ((->) a) where
    -- fmap :: (b -> c) -> (a -> b) -> (a -> c)
    fmap = (.)
-}


-- problem 3
-- commented out because of duplicate instance declaratoin

{-
instance Applicative ((->) a) where
    -- pure :: b -> (a -> b)
    pure x = \_ -> x

    -- <*> :: (a -> b -> c) -> (a -> b) -> (a -> c)
    g <*> h = \x -> g x (h x)
-}


