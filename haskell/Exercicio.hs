module Exercicio where

import Data.List (intercalate)
import Data.List.Split (splitOn)
import System.Directory (renameFile, removeFile)

data Exercicio = Exercicio {
    id :: String,
    idLicao :: String,
    exercicio :: [(Char, String)],
    status :: String
    -- avaliacao :: Avaliacao
} deriving (Show, Read)

getDadosExercicios :: IO [(String, String, String)]
getDadosExercicios = do
    conteudo <- readFile "../dados/tabela_exercicio.txt"
    let linhas = tail $ map (splitOn ";") (lines conteudo)
    return $ map (\[id, idLicao, status] -> (id, idLicao, status)) linhas

getStatusExercicios :: String -> String -> [(String, String, String)] -> String
getStatusExercicios idEx idLic [] = ""
getStatusExercicios idEx idLic dados =
    let (id, idLicao, status) = head dados
    in if id == idEx && idLicao == idLic
        then status
        else getStatusExercicios idEx idLic (tail dados)

atualizaLinha :: String -> String -> String -> String
atualizaLinha idEx idLic linha =
    let [id, idLicao, status] = splitOn ";" linha
    in if id == idEx && idLicao == idLic
       then intercalate ";" [id, idLicao, "concluido"]
       else linha

setDadosExercicios :: String -> String -> IO ()
setDadosExercicios idExercicio idLicao = do
    let filePath = "../dados/tabela_exercicio.txt"
        tempFilePath = filePath ++ ".tmp"

    conteudo <- readFile filePath
    let linhas = lines conteudo
        linhasProcessadas = map (\linha -> atualizaLinha idExercicio idLicao linha) linhas

    writeFile tempFilePath (unlines linhasProcessadas)

    renameFile tempFilePath filePath