module Exercicio where
    data Exercicio = Exercicio {
        exercicio :: [(Char, String)],
        status :: String
    } deriving (Show, Read)