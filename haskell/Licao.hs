module Licao where

import Exercicio
import Data.List (intercalate)
import Data.List.Split (splitOn)
import System.Directory (renameFile, removeFile)

data Licao = Licao {
    id :: String,
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

contarLicoesConcluidas :: [Licao] -> Int
contarLicoesConcluidas [] = 0
contarLicoesConcluidas (licao:licoes) =
    if (status licao) == "concluido"
    then 1 + contarLicoesConcluidas licoes
    else contarLicoesConcluidas licoes

atualizarLinha :: String -> String -> String
atualizarLinha idLicao linha =
    let [id, status] = splitOn ";" linha
    in if id == idLicao
       then intercalate ";" [id, "concluido"]
       else linha

setStatusLicao :: String -> IO ()
setStatusLicao idLicao = do
    let filePath = "../dados/tabela_licao.txt"
        tempFilePath = filePath ++ ".tmp"

    conteudo <- readFile filePath
    let linhas = lines conteudo
        linhasProcessadas = map (\linha -> atualizarLinha idLicao linha) linhas

    writeFile tempFilePath (unlines linhasProcessadas)

    renameFile tempFilePath filePath