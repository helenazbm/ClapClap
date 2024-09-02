{-# LANGUAGE BlockArguments #-}
module Menu where

import Licao
import Data.Char(toLower)
import Controller (licoes)
import Text.Read(readMaybe)
import System.Exit (exitSuccess)
import Util(limpaTela, leCaractere)
import System.Posix.Internals (o_RDONLY)
import Sprites (exibeProgresso, formataRanking, aplicaCorInstrucao)
import Desafio (iniciaDesafio, Desafio (UmMinuto, DoisMinutos, TresMinutos), getRanking)


imprimeMenu :: IO()
imprimeMenu = do
    limpaTela
    menu <- readFile "../dados/arteTexto/menu.txt"
    putStrLn menu 
    opcaoSelecionada <- getLine
    opcoesMenuPrincipal (map toLower opcaoSelecionada)

opcoesMenuPrincipal :: String -> IO()
opcoesMenuPrincipal o
    | o == "l" = listaLicoes
    | o == "d" = listaDesafios
    | o == "t" = exibeTutorial
    | o == "s" = sai
    | otherwise = imprimeMenu


listaLicoes :: IO ()
listaLicoes = do
    limpaTela

    dadosLicoes <- getDadosLicoes
    let todasLicoes = licoes dadosLicoes

    putStrLn (exibeProgresso (contaLicoesConcluidas todasLicoes))
    putStrLn (exibeLicoesConcluida todasLicoes)

    licoes <- readFile "../dados/arteTexto/licoes.txt"
    putStrLn licoes
    comandoUsuario <- getLine
    if comandoUsuario == ""
        then imprimeMenu
        else case readMaybe comandoUsuario of
            Just n | n >= 1 && n <= 15 -> exibeLicao n todasLicoes
            _ -> do
                listaLicoes

exibeLicao :: Int -> [Licao] -> IO ()
exibeLicao idLicao licoes = do
    limpaTela
    let licaoSelecionada = licoes !! (idLicao - 1)
    instrucaoLicao <- readFile (instrucao licaoSelecionada)
    putStrLn $ aplicaCorInstrucao instrucaoLicao
    opcao <- leCaractere
    if opcao == 'i' then do
        limpaTela
        iniciaLicao licaoSelecionada
        setStatusLicao (show idLicao)
        voltaMenuLicoes
     else if opcao == '\n' then 
        listaLicoes
     else do
        exibeLicao idLicao licoes
    
listaDesafios :: IO ()
listaDesafios = do
    limpaTela
    desafios <- readFile "../dados/arteTexto/desafios.txt"
    putStrLn desafios
    opcao <- getLine 
    opcoesMenuDesafio (map toLower opcao)
    voltaMenuDesafios

opcoesMenuDesafio :: String-> IO ()
opcoesMenuDesafio o
    | o == "1" = iniciaDesafio UmMinuto
    | o == "2" = iniciaDesafio DoisMinutos
    | o == "3" = iniciaDesafio TresMinutos
    | o == "r" = exibeRanking
    | o == "" = imprimeMenu
    | otherwise = listaDesafios

exibeRanking :: IO ()
exibeRanking = do
    limpaTela
    getRanking
    voltaMenuDesafios

exibeTutorial :: IO ()
exibeTutorial = do
    limpaTela
    tutorial <- readFile "../dados/arteTexto/tutorial.txt"
    putStrLn tutorial
    voltaMenuPrincipal

sai :: IO()
sai = do
    limpaTela
    sai <- readFile "../dados/arteTexto/sai.txt"
    putStrLn $ aplicaCorInstrucao sai
    exitSuccess

voltaMenuPrincipal :: IO()
voltaMenuPrincipal = do
    _ <- getLine
    imprimeMenu

voltaMenuLicoes :: IO()
voltaMenuLicoes = do
    _ <- getLine
    listaLicoes

voltaMenuDesafios :: IO()
voltaMenuDesafios = do
    _ <- getLine
    listaDesafios