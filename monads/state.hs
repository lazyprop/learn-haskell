import Control.Monad


data TurnstileState = Locked | Unlocked
    deriving (Eq, Show)

data TurnstileOutput = Thank | Open | Tut
    deriving (Eq, Show)

coin, push :: TurnstileState -> (TurnstileOutput, TurnstileState)

coin _ = (Thank, Unlocked)

push Unlocked = (Open, Locked)
push Locked   = (Tut, Locked)


monday :: TurnstileState -> ([TurnstileOutput], TurnstileState)
monday s0 =
    let (a1, s1) = coin s0
        (a2, s2) = push s1
        (a3, s3) = push s2
        (a4, s4) = coin s3
        (a5, s5) = push s4
     in ([a1, a2, a3, a4, a5], s5)


newtype State s a = State { runState :: s -> (a, s) }

state :: (s -> (a, s)) -> State s a
state = State


instance Functor (State s) where
    fmap = liftM

instance Applicative (State s) where
    pure = return
    (<*>) = ap

instance Monad (State s) where
    return :: a -> State s a
    return x = State ( \s -> (x, s) )


    (>>=) :: State s a -> (a -> State s b) -> State s b

