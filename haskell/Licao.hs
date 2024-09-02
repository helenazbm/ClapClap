module Licao where

import Data.List (intercalate)
import Sprites (aplicaCorSucessoFalha)
import Data.List.Split (splitOn)
import Util (limpaTela, leCaractere)
import Exercicio (Exercicio, iniciaExercicio)
import System.Directory (renameFile, removeFile)
import Avaliacao (atribuaEstrelasLicao, calculaPrecisaoExercicios)

data Licao = Licao {
    id :: String,
    exercicios :: [Exercicio],
    status :: String,
    instrucao  :: String
} deriving (Show, Read)

getDadosLicoes :: IO [(String, String)]
getDadosLicoes = do
    conteudo <- readFile "../dados//tabelas/tabela_licao.txt"
    let linhas = tail $ map (splitOn ";") (lines conteudo)
    return $ map (\[id, status] -> (id, status)) linhas

getStatusLicoes :: String -> [(String, String)] -> String
getStatusLicoes idLicao [] = ""
getStatusLicoes idLicao dados =
    let (id, status) = head dados
    in if id == idLicao
        then status
        else getStatusLicoes idLicao (tail dados)

contaLicoesConcluidas :: [Licao] -> Int
contaLicoesConcluidas [] = 0
contaLicoesConcluidas (licao:licoes) =
    if (status licao) == "concluido"
    then 1 + contaLicoesConcluidas licoes
    else contaLicoesConcluidas licoes

atualizaLinha :: String -> String -> String
atualizaLinha idLicao linha =
    let [id, status] = splitOn ";" linha
    in if id == idLicao
       then intercalate ";" [id, "concluido"]
       else linha

setStatusLicao :: String -> IO ()
setStatusLicao idLicao = do
    let filePath = "../dados//tabelas/tabela_licao.txt"
        tempFilePath = filePath ++ ".tmp"

    conteudo <- readFile filePath
    let linhas = lines conteudo
        linhasProcessadas = map (\linha -> atualizaLinha idLicao linha) linhas

    writeFile tempFilePath (unlines linhasProcessadas)

    renameFile tempFilePath filePath

iniciaLicao :: Licao -> IO ()
iniciaLicao licao = do
    
    let exs = (zip [1..] (exercicios licao))
    resultados <- mapM (\(numero, ex) -> do
            erros <- iniciaExercicio ex numero
            return erros) exs
    avaliaLicao resultados

avaliaLicao :: [(Int, Int)] -> IO ()
avaliaLicao resultados = do
    let totalErros = sum $ map fst resultados
        totalLetras = sum $ map snd resultados
        precisao = calculaPrecisaoExercicios totalLetras totalErros
        estrelas = atribuaEstrelasLicao precisao 

    limpaTela
    putStrLn "\n"
    putStrLn $ replicate 64 ' ' ++ "Sua precisão de acertos foi de: " ++ show precisao ++ "%"
    putStrLn $ replicate 64 ' ' ++ show (totalLetras - totalErros) ++ "/" ++ show totalLetras ++ " caracteres digitados corretamente\n"

    licaoConcluida <- case estrelas of
        0 -> readFile "../dados/arteTxt/avaliacoes/zeroEstrela.txt"
        1 -> readFile "../dados/arteTxt/avaliacoes/licao/umaEstrela.txt"
        2 -> readFile "../dados/arteTxt/avaliacoes/duasEstrelas.txt"
        3 -> readFile "../dados/arteTxt/avaliacoes/licao/tresEstrelas.txt" 
    putStrLn licaoConcluida
    putStrLn $ replicate 60 ' ' ++ "* Pressione Enter para voltar ao Menu de Lições *"

formataLicoesConcluida :: [Licao] -> String
formataLicoesConcluida (licao:[]) = aplicaCorSucessoFalha ((status licao) == "concluido") (Licao.id licao)
formataLicoesConcluida (licao:licoes) = aplicaCorSucessoFalha ((status licao) == "concluido") (Licao.id licao) ++ ", " ++ formataLicoesConcluida licoes

exibeLicoesConcluida :: [Licao] -> String
exibeLicoesConcluida licoes = "\n                                                    Concluídas: [" ++ formataLicoesConcluida licoes ++ "]"