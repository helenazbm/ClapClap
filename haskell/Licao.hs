module Licao where

import Data.List (intercalate)
import Sprites (colorirPalavra)
import Data.List.Split (splitOn)
import Util (limparTela, lerCaractere)
import Exercicio (Exercicio, iniciarExercicio)
import System.Directory (renameFile, removeFile)
import Avaliacao (atribuirEstrelasLicao, calcularPrecisaoExercicios)


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

iniciarLicao :: Licao -> IO ()
iniciarLicao licao = do
    
    let exs = exercicios licao
    resultados <- mapM (\ex -> do
            erros <- iniciarExercicio ex
            return erros) exs
    avaliaLicao resultados


avaliaLicao :: [(Int, Int)] -> IO ()
avaliaLicao resultados = do
    let totalErros = sum $ map fst resultados
        totalLetras = sum $ map snd resultados
        precisao = calcularPrecisaoExercicios totalLetras totalErros
        estrelas = atribuirEstrelasLicao precisao 

    limparTela
    putStrLn "\n"
    putStrLn $ replicate 64 ' ' ++ "Sua precisão de acertos foi de: " ++ show precisao ++ "%"
    putStrLn $ replicate 64 ' ' ++ show (totalLetras - totalErros) ++ "/" ++ show totalLetras ++ " caracteres digitados corretamente\n"

    licaoConcluida <- case estrelas of
        0 -> readFile "../dados/avaliacoes/zeroEstrela.txt"
        1 -> readFile "../dados/avaliacoes/licao/umaEstrela.txt"
        2 -> readFile "../dados/avaliacoes/duasEstrelas.txt"
        3 -> readFile "../dados/avaliacoes/licao/tresEstrelas.txt" 
    putStrLn licaoConcluida
    putStrLn $ replicate 60 ' ' ++ "* Pressione Enter para voltar ao Menu de Lições *"

formataLicoesConcluida :: [Licao] -> String
formataLicoesConcluida (licao:[]) = colorirPalavra ((status licao) == "concluido") (Licao.id licao)
formataLicoesConcluida (licao:licoes) = colorirPalavra ((status licao) == "concluido") (Licao.id licao) ++ ", " ++ formataLicoesConcluida licoes

exibirLicoesConcluida :: [Licao] -> String
exibirLicoesConcluida licoes = "\n                                                    Concluídas: [" ++ formataLicoesConcluida licoes ++ "]"