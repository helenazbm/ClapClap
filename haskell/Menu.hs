module Menu where
import FerramentasIO(limparTela)
import Data.Char(toLower)
import Text.Read(readMaybe)
import Sprites (licoes, getDadosLicoes, getDadosExercicios, setDadosExercicios, formataLinhasTexto)
import Licao (getExercicioLicao, corrigeExercicio)
import Exercicio (Exercicio, exercicio, id, idLicao)

-- Imprime o menu principal e recebe a opção do usuário
printMenu :: IO()
printMenu = do
    limparTela
    menu <- readFile "../dados/arteTexto/menu.txt"
    putStrLn menu 
    opcaoSelecionada <- getLine
    opcaoUsuario (map toLower opcaoSelecionada)

-- Volta para o menu principal
voltarMenu :: IO()
voltarMenu = do
    _ <- getLine
    printMenu

-- Lida com a resposta do usuário
opcaoUsuario :: String -> IO()
opcaoUsuario o
    | o == "l" = exibirLicoes
    | o == "d" = exibirDesafios
    | o == "r" = exibirRankinng
    | o == "t" = exibirTutorial
    | o == "s" = sair
    | otherwise = printMenu


-- exibe as licões e recebe a opção do usuário
exibirLicoes :: IO ()
exibirLicoes = do
    limparTela
    licoes <- readFile "../dados/arteTexto/licoes.txt"
    putStrLn licoes
    comandoUsuario <- getLine
    if comandoUsuario == ""
        then printMenu
        else case readMaybe comandoUsuario of
            Just n | n >= 1 && n <=15 -> iniciarLicao n 
            _ -> do
                putStrLn "Opção inválida."
                exibirLicoes

-- inicia lição escolhida pelo usuário
iniciarLicao :: Int -> IO ()
iniciarLicao n = do
    limparTela
    dadosLicoes <- getDadosLicoes
    dadosExercicios <- getDadosExercicios

    let ex = (getExercicioLicao (licoes dadosLicoes dadosExercicios))
    let textLines = formataLinhasTexto (exercicio ex) " "

    mapM_ putStrLn textLines

    entrada <- getLine :: IO String
    let textLines2 = formataLinhasTexto (corrigeExercicio entrada (exercicio ex)) " "
    setDadosExercicios (Exercicio.id ex) (Exercicio.idLicao ex)
    mapM_ putStrLn textLines2


-- exibe os desafios
exibirDesafios :: IO ()
exibirDesafios = do
    limparTela
    desafios <- readFile "../dados/arteTexto/desafios.txt"
    putStrLn desafios
    voltarMenu

-- exibe o ranking
exibirRankinng :: IO ()
exibirRankinng = do
    limparTela
    ranking <- readFile "../dados/arteTexto/ranking.txt"
    putStrLn ranking
    voltarMenu

-- exibe o tutorial
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