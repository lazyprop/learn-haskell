data Maybe' a = Just' a | Nothing'
    deriving Show

instance Functor Maybe' where
    fmap f (Just' x) = Just' (f x)
    fmap f Nothing'  = Nothing'

data Tree a = Leaf a | Node a (Tree a) (Tree a)
    deriving Show

instance Functor Tree where
    fmap g (Leaf x)            = Leaf (g x)
    fmap g (Node x left right) = Node (g x) (fmap g left) (fmap g right)


exampleTree = Node 1 (Node 2 (Leaf 3) (Leaf 4)) (Node 5 (Leaf 6) (Leaf 7))
