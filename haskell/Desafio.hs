{-# LANGUAGE OverloadedStrings #-}

module Desafio where

import Control.Concurrent.Async (race)
import System.IO
import System.Console.ANSI
import Control.Concurrent (threadDelay, forkIO)
import Control.Monad (unless, forever, void)
import Data.Time.Clock (getCurrentTime, diffUTCTime)
import System.IO (hFlush, stdout)
import System.Random (randomRIO)
import Control.Concurrent.MVar (MVar, newEmptyMVar, putMVar, takeMVar, tryTakeMVar, isEmptyMVar)
import FerramentasIO (limparTela)

data Desafio = UmMinuto | DoisMinutos | CincoMinutos

tempoDesafio :: Desafio -> Int
tempoDesafio UmMinuto     = 60
tempoDesafio DoisMinutos  = 120
tempoDesafio CincoMinutos = 300

frases :: [String]
frases = 
    [ "\na programação lógica e funcional é um jeito de programar que foca em resolver problemas usando lógica e matemática. dentro desse jeito, a linguagem haskell se destaca como uma ferramenta importante para programação funcional. haskell usa conceitos como imutabilidade e funções como elementos principais, o que ajuda a escrever código mais claro e direto. sua forte tipagem e a capacidade de entender tipos automaticamente ajudam a evitar erros comuns, tornando o código mais seguro e confiável. além disso, haskell tem um sistema de tipos avançado que permite criar programas mais sofisticados e fáceis de entender. por essas razões, haskell é muito usada para ensinar e explorar os fundamentos da programação funcional e lógica."
    ]

fraseAleatoria :: IO String
fraseAleatoria = do
    index <- randomRIO (0, length frases - 1)
    return (frases !! index)

contarTempo :: Int -> MVar () -> IO ()
contarTempo tempo tempoMVar = do
    threadDelay (tempo * 1000000)  
    putMVar tempoMVar ()  

green = "\x1b[32m"
red = "\x1b[31m"
reset = "\x1b[0m"

colorWord :: Bool -> String -> String
colorWord True word = green ++ word ++ reset
colorWord False word = red ++ word ++ reset

compararPalavras :: [String] -> [String] -> [String]
compararPalavras [] [] = []
compararPalavras (c:cs) (d:ds) = colorWord (c == d) c : compararPalavras cs ds
compararPalavras (c:cs) [] = colorWord False c : compararPalavras cs []
compararPalavras [] (d:ds) = colorWord False "" : compararPalavras [] ds

compararFrases :: String -> String -> String
compararFrases fraseCorreta fraseDigitada = unwords (compararPalavras palavrasCorretas palavrasDigitadas)
  where
    palavrasCorretas = words fraseCorreta
    palavrasDigitadas = words fraseDigitada

executarDesafioSimulado :: MVar () -> IO ()
executarDesafioSimulado tempoMVar = do
    let loop = do
            frase <- fraseAleatoria
            putStrLn frase
            putStr "\nDigite a frase: "
            hFlush stdout

            resultado <- race (takeMVar tempoMVar) getLine
            case resultado of
                Left _ -> do
                    putStrLn ""
                    putStrLn "\nTempo esgotado! Pressione enter para ver seu resultado."
                    string <- getLine
                    let resultadoFrase = compararFrases frase string
                    putStrLn resultadoFrase
                Right input -> do
                    let resultadoFrase = compararFrases frase input
                    putStrLn ""
                    putStrLn resultadoFrase

    loop

iniciarDesafio :: Desafio -> IO ()
iniciarDesafio desafio = do
    limparTela
    let tempo = tempoDesafio desafio
    putStrLn "Prepare-se para o desafio!\n"
    threadDelay 2000000
    tempoMVar <- newEmptyMVar
    _ <- forkIO (contarTempo tempo tempoMVar)
    executarDesafioSimulado tempoMVar
    putStrLn "Fim do desafio!"

main :: IO ()
main = do
    iniciarDesafio UmMinuto
-- iniciarDesafio doisMinutos
-- iniciarDesafio cincoMinutos