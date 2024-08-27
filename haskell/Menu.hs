{-# LANGUAGE BlockArguments #-}
module Menu where

import Licao
import Data.Char(toLower)
import Controller (licoes)
import Text.Read(readMaybe)
import Sprites (exibirProgresso)
import Util(limparTela, lerCaractere, coloreTexto)
import Desafio (iniciarDesafio, Desafio (UmMinuto, DoisMinutos, CincoMinutos))


printMenu :: IO()
printMenu = do
    limparTela
    menu <- readFile "../dados/arteTexto/menu.txt"
    putStrLn menu 
    opcaoSelecionada <- getLine
    opcaoUsuario (map toLower opcaoSelecionada)

opcaoUsuario :: String -> IO()
opcaoUsuario o
    | o == "l" = listarLicoes
    | o == "d" = exibirDesafios
    | o == "t" = exibirTutorial
    | o == "s" = sair
    | otherwise = printMenu


listarLicoes :: IO ()
listarLicoes = do
    limparTela

    dadosLicoes <- getDadosLicoes
    let todasLicoes = licoes dadosLicoes

    putStrLn (exibirProgresso (contarLicoesConcluidas todasLicoes))
    putStrLn (exibirLicoesConcluida todasLicoes)

    licoes <- readFile "../dados/arteTexto/licoes.txt"
    putStrLn licoes
    comandoUsuario <- getLine
    if comandoUsuario == ""
        then printMenu
        else case readMaybe comandoUsuario of
            Just n | n >= 1 && n <= 15 -> exibirLicao n todasLicoes
            _ -> do
                listarLicoes

exibirLicao :: Int -> [Licao] -> IO ()
exibirLicao idLicao licoes = do
    limparTela
    let licaoSelecionada = licoes !! (idLicao - 1)
    instrucaoLicao <- readFile (instrucao licaoSelecionada)
    putStrLn $ coloreTexto instrucaoLicao
    opcao <- lerCaractere
    if opcao == 'i' then do
        limparTela
        iniciarLicao licaoSelecionada
        setStatusLicao (show idLicao)
        voltarMenuLicoes
     else if opcao == '\n' then 
        listarLicoes
     else do
        exibirLicao idLicao licoes
    
exibirDesafios :: IO ()
exibirDesafios = do
    limparTela
    desafios <- readFile "../dados/arteTexto/desafios.txt"
    putStrLn desafios
    opcao <- getLine
    opcaoUsuarioDesafio opcao
    -- ir para o ranking
    voltarMenu
    
opcaoUsuarioDesafio :: String-> IO ()
opcaoUsuarioDesafio o
    | o == "1" = iniciarDesafio UmMinuto
    | o == "2" = iniciarDesafio DoisMinutos
    | o == "5" = iniciarDesafio CincoMinutos
    | o == "" = printMenu
    | otherwise = exibirDesafios


exibirTutorial :: IO ()
exibirTutorial = do
    limparTela
    tutorial <- readFile "../dados/arteTexto/tutorial.txt"
    putStrLn tutorial
    voltarMenu

sair :: IO()
sair = do
    limparTela
    sair <- readFile "../dados/arteTexto/sair.txt"
    putStrLn sair
    return ()

voltarMenu :: IO()
voltarMenu = do
    _ <- getLine
    printMenu

voltarMenuLicoes :: IO()
voltarMenuLicoes = do
    _ <- getLine
    listarLicoes