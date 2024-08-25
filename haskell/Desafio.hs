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
import Sprites (getCor)

data Desafio = UmMinuto | DoisMinutos | CincoMinutos

tempoDesafio :: Desafio -> Int
tempoDesafio UmMinuto     = 60
tempoDesafio DoisMinutos  = 120
tempoDesafio CincoMinutos = 300

frases :: [String]
frases = 
    [ "\na programação lógica e funcional é um jeito de programar que foca em resolver problemas usando lógica e matemática. dentro desse jeito, a linguagem haskell se destaca como uma ferramenta importante para programação funcional. haskell usa conceitos como imutabilidade e funções como elementos principais, o que ajuda a escrever código mais claro e direto. sua forte tipagem e a capacidade de entender tipos automaticamente ajudam a evitar erros comuns, tornando o código mais seguro e confiável. além disso, haskell tem um sistema de tipos avançado que permite criar programas mais sofisticados e fáceis de entender. por essas razões, haskell é muito usada para ensinar e explorar os fundamentos da programação funcional e lógica.",
    "\no paradigma funcional é um estilo de programação onde o foco está em usar funções para resolver problemas. imagine uma função como uma pequena caixa preta que recebe um input, faz algum tipo de cálculo ou processamento e retorna um output. o que torna o paradigma funcional especial é que, em vez de mudar o estado do programa ou dos dados, ele usa funções que operam sobre entradas e retornam saídas sem modificar nada fora delas. isso ajuda a evitar muitos erros comuns, pois as funções são independentes e não têm efeitos colaterais. por exemplo, se você tem uma função que soma dois números, sempre que você a chama com os mesmos números, ela sempre retornará o mesmo resultado, não importa quando ou onde você a use. esse estilo de programação é muito útil em projetos grandes, pois facilita o teste e a manutenção do código. linguagens como haskell são conhecidas por adotar o paradigma funcional, oferecendo um ambiente onde o código é mais previsível e mais fácil de entender. outro benefício do paradigma funcional é que ele facilita a criação de código paralelo, pois funções independentes podem ser executadas simultaneamente sem causar problemas. em resumo, o paradigma funcional é uma abordagem que torna o desenvolvimento de software mais organizado e menos propenso a erros, utilizando funções puras e evitando mudanças inesperadas no estado dos dados.",
    "\no paradigma imperativo é uma maneira de programar onde você dá instruções passo a passo para o computador seguir. imagine que você está seguindo uma receita de bolo: cada passo deve ser seguido em uma ordem específica para obter o resultado desejado. da mesma forma, na programação imperativa, você escreve um conjunto de comandos que o computador executa um após o outro. isso é muito intuitivo porque é semelhante à forma como normalmente pensamos sobre resolver problemas. linguagens como C e Java utilizam o paradigma imperativo, permitindo que você controle detalhadamente o fluxo do programa. por exemplo, você pode usar loops para repetir um conjunto de instruções e condicionais para tomar decisões baseadas em testes específicos. no entanto, conforme os programas se tornam maiores e mais complexos, pode ser difícil gerenciar o estado do programa, pois ele muda à medida que as instruções são executadas. isso pode levar a bugs e comportamentos inesperados se o estado não for bem controlado. para lidar com esses problemas, algumas linguagens imperativas modernas oferecem recursos que ajudam a organizar o código e torná-lo mais fácil de entender. apesar desses desafios, o paradigma imperativo é amplamente utilizado devido à sua flexibilidade e capacidade de oferecer controle preciso sobre a execução dos programas."
    ]

fraseAleatoria :: IO String
fraseAleatoria = do
    index <- randomRIO (0, length frases - 1)
    return (frases !! index)

contarTempo :: Int -> MVar () -> IO ()
contarTempo tempo tempoMVar = do
    threadDelay (tempo * 1000000)  
    putMVar tempoMVar ()  

colorirPalavra :: Bool -> String -> String
colorirPalavra True palavra = getCor "green" ++ palavra ++ getCor "default"
colorirPalavra False palavra = getCor "red" ++ palavra ++ getCor "default"

compararPalavras :: [String] -> [String] -> [String]
compararPalavras [] [] = []
compararPalavras (c:cs) (d:ds) = colorirPalavra (c == d) c : compararPalavras cs ds
compararPalavras (c:cs) [] = colorirPalavra False c : compararPalavras cs []
compararPalavras [] (d:ds) = colorirPalavra False "" : compararPalavras [] ds

compararFrases :: String -> String -> String
compararFrases fraseCorreta fraseDigitada = unwords (compararPalavras palavrasCorretas palavrasDigitadas)
  where
    palavrasCorretas = words fraseCorreta
    palavrasDigitadas = words fraseDigitada

executarDesafio :: MVar () -> IO ()
executarDesafio tempoMVar = do
    let loop = do
            frase <- fraseAleatoria
            putStrLn frase
            putStrLn "\nDigite o texto:"
            hFlush stdout

            resultado <- race (takeMVar tempoMVar) getLine
            case resultado of
                Left _ -> do
                    limparTela
                    putStrLn "\nTempo esgotado! Pressione enter para ver seu resultado."
                    string <- getLine
                    let resultadoFrase = compararFrases frase string
                    putStrLn resultadoFrase
                    putStrLn "Fim do desafio!"
                Right input -> do
                    limparTela
                    putStrLn "O tempo não esgotou, reinicie o desafio!"
    loop

iniciarDesafio :: Desafio -> IO ()
iniciarDesafio desafio = do
    limparTela
    let tempo = tempoDesafio desafio
    putStrLn "Prepare-se para o desafio!\n"
    threadDelay 2000000
    tempoMVar <- newEmptyMVar
    _ <- forkIO (contarTempo tempo tempoMVar)
    executarDesafio tempoMVar