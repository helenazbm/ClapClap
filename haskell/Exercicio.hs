module Exercicio where

data Exercicio = Exercicio {
    id :: String,
    idLicao :: String,
    exercicio :: [(Char, String)],
    status :: String
    -- avaliacao :: Avaliacao
} deriving (Show, Read)