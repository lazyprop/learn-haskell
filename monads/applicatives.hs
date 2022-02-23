data Maybe' a = Just' a | Nothing'
    deriving Show

instance Functor Maybe' where
    -- fmap :: (a -> b) :: Maybe' a -> Maybe' b
    fmap f (Just' x) = Just' (f x)
    fmap _ Nothing'  = Nothing

instance Applicative Maybe' where
    pure = Just'

    -- <*> :: Maybe' (a -> b) -> Maybe' a -> Maybe' b
    (Just' f) <*> j = fmap f j
    Nothing'  <*> _ = Nothing'
