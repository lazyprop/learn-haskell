import State

data Tree a = Leaf a | Node (Tree a) (Tree a)
    deriving Show

tree :: Tree Char
tree = Node (Node (Leaf 'a') (Leaf 'b')) (Leaf 'c')

-- recursive relabel
rlabel :: Tree Char -> Int -> (Tree Int, Int)
rlabel (Leaf _) n   = (Leaf n, n+1)
rlabel (Node l r) n =
    let (l', n')  = rlabel l n
        (r', n'') = rlabel r n'
     in (Node l' r', n'')


fresh :: ST Int
fresh = S (\n -> (n, n+1))

-- applicative relabel
alabel :: Tree Char -> ST (Tree Int)
alabel (Leaf _)   = pure Leaf <*> fresh
alabel (Node l r) = pure Node <*> alabel l <*> alabel r






















-- monadic relabel
mlabel :: Tree a -> ST (Tree Int)
mlabel (Leaf _)   = do
    n <- fresh
    return (Leaf n)
mlabel (Node l r) = do
    l' <- mlabel l
    r' <- mlabel r
    return (Node l' r')

