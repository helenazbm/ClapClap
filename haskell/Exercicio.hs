module Exercicio where
    data Exercicio = Exercicio {
        exercicio :: [String],
        status :: String
    } deriving (Show, Read)