module Licao where

    import Exercicio

    data Licao = Licao {
        instrucao :: String,
        exercicios :: [Exercicio],
        status :: String
    } deriving (Show, Read)