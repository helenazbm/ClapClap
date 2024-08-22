module Licao where

import Exercicio
import Data.List.Split (splitOn)

data Licao = Licao {
    exercicios :: [Exercicio],
    status :: String,
    instrucao  :: String
} deriving (Show, Read)

getDadosLicoes :: IO [(String, String)]
getDadosLicoes = do
    conteudo <- readFile "../dados/tabela_licao.txt"
    let linhas = tail $ map (splitOn ";") (lines conteudo)
    return $ map (\[id, status] -> (id, status)) linhas

getStatusLicoes :: String -> [(String, String)] -> String
getStatusLicoes idLicao [] = ""
getStatusLicoes idLicao dados =
    let (id, status) = head dados
    in if id == idLicao
        then status
        else getStatusLicoes idLicao (tail dados)

corrigeExercicio :: String -> [(Char, String)] -> [(Char, String)]
corrigeExercicio entrada [] = []
corrigeExercicio "" ((gabarito, cor):gabaritos) = [(gabarito, "red")] ++ corrigeExercicio "" gabaritos
corrigeExercicio (en:entrada) ((gabarito, cor):gabaritos) = if en == gabarito
                                                            then [(gabarito, "green")] ++ corrigeExercicio entrada gabaritos
                                                            else [(gabarito, "red")] ++ corrigeExercicio entrada gabaritos