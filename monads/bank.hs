-- a bank example to practice the State monad

import Control.Monad.State

type BankState  = Int
type BankOutput = Maybe Int

withdrawS :: Int -> State BankState BankOutput
withdrawS amount = state $ 
    \balance -> if amount > balance
                then (Nothing, balance)
                else (Just amount, balance - amount)

depositS :: Int -> State BankState BankOutput
depositS amount = state $
    \balance -> (Just amount, balance + amount)

crazyPerson :: State BankState [BankOutput]
crazyPerson = sequence [ withdrawS 100
                       , withdrawS 200
                       , withdrawS 400
                       , withdrawS 1600
                       , withdrawS 10000
                       ]


main :: IO ()
main = do
    inp <- getLine
    let transaction = (words inp) !! 0
    let amount = read $ (words inp) !! 1 :: Int
    let balance = 0
    print balance
    let newState = case transaction of
                        "withdraw" -> runState (withdrawS amount) balance
                        "deposit" -> runState (depositS amount) balance
    print newState

