module Ranking where

import System.IO

data Jogador = Jogador { nome :: String, ppm :: Int, precisao :: Float}

type Ranking = [Jogador]

escreverRanking :: Jogador -> IO ()
escreverRanking jogador = do
    appendFile "../dados/ranking.txt" (formatarJogador jogador ++ "\n")

formatarJogador :: Jogador -> String
formatarJogador jogador = nome jogador ++ " - PPM: " ++ show (ppm jogador) ++ " - Precisão: " ++ show (precisao jogador) 

lerRanking :: IO Ranking
lerRanking = do
    conteudo <- readFile "../dados/ranking.txt"
    return (parseRanking conteudo)

parseRanking :: String -> Ranking
parseRanking conteudo = map parseLinha (lines conteudo)

parseLinha :: String -> Jogador
parseLinha linha = 
    let [nome, _, ppm, _, precisao, _, estrelas] = words linha
    in Jogador { nome = nome, ppm = read ppm, precisao = read precisao }

-- Função para adicionar um jogador ao ranking
adicionarAoRanking :: Jogador -> IO ()
adicionarAoRanking jogador = do
    ranking <- lerRanking
    escreverRanking jogador