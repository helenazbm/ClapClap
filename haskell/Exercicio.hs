module Exercicio where
    data Exercicio = Exercicio {
        exercicio :: [(Char, String)],
        status :: String
        -- avaliacao :: Avaliacao
    } deriving (Show, Read)