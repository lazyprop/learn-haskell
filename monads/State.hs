module State (State, ST(S), app) where

type State = Int
newtype ST a = S (State -> (a, State))

app :: ST a -> State -> (a, State)
app (S st) s = st s


instance Functor ST where
    -- fmap :: (a -> b) -> ST a -> ST b
    fmap g st = S (\s -> let (x, s') = app st s in (g x, s'))

instance Applicative ST where
    -- pure :: a -> ST a
    pure x = S (\s -> (x, s))

    -- <*> :: ST (a -> b) -> ST a -> ST b
    stf <*> stx = S (\s -> 
        let (f, s')  = app stf s
            (x, s'') = app stx s'
         in (f x, s''))

instance Monad ST where
    -- (>>=) :: ST a -> (a -> ST b) -> ST b
    st >>= f = S (\s ->
        let (x, s') = app st s
         in app (f x) s')

