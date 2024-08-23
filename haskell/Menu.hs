module Menu where
import FerramentasIO(limparTela, delay)
import Data.Char(toLower)
import Text.Read(readMaybe)
import Sprites (licoes, formataLinhasTexto, exibeProgresso)
import Licao (Licao (exercicios), getDadosLicoes, corrigeExercicio, instrucao, setStatusLicao, contaLicoesConcluidas)
import Exercicio (Exercicio, exercicio, id, idLicao)
import Avaliacao

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

-- Volta para o menu de lições
voltarMenuLicoes :: IO()
voltarMenuLicoes = do
    _ <- getLine
    exibirLicoes            

-- Lida com a resposta do usuário
opcaoUsuario :: String -> IO()
opcaoUsuario o
    | o == "l" = exibirLicoes
    | o == "d" = exibirDesafios
    | o == "t" = exibirTutorial
    | o == "s" = sair
    | otherwise = printMenu


-- exibe as licões e recebe a opção do usuário
exibirLicoes :: IO ()
exibirLicoes = do
    limparTela

    dadosLicoes <- getDadosLicoes
    let todasLicoes = licoes dadosLicoes

    mapM_ putStrLn (exibeProgresso (contaLicoesConcluidas todasLicoes))

    licoes <- readFile "../dados/arteTexto/licoes.txt"
    putStrLn licoes
    comandoUsuario <- getLine
    if comandoUsuario == ""
        then printMenu
        else case readMaybe comandoUsuario of
            Just n | n >= 1 && n <= 15 -> iniciarLicao n todasLicoes
            _ -> do
                putStrLn "Opção inválida."
                exibirLicoes

-- inicia lição escolhida pelo usuário
iniciarLicao :: Int -> [Licao] -> IO ()
iniciarLicao idLicao licoes = do
    limparTela

    let licaoSelecionada = licoes !! (idLicao - 1)
    instrucaoLicao <- readFile (instrucao licaoSelecionada)
    putStrLn instrucaoLicao
    _ <- getLine
    limparTela
    setStatusLicao (show idLicao)
    loopExercicios licaoSelecionada

-- Função para fazer todos os exercícios de uma lição
loopExercicios :: Licao -> IO ()
loopExercicios licao = do
    
    let exs = exercicios licao
    resultados <- mapM (\ex -> do
            erros <- fazerExercicio ex
            limparTela
            return erros) exs

    let totalErros = sum $ map fst resultados
        totalLetras = sum $ map snd resultados
        precisao = calculaPrecisaoExercicios totalLetras totalErros
    
    putStrLn $ "Sua precisão de acertos foi de : " ++ show precisao ++ "%"
    licaoConcluida <- readFile "../dados/arteTexto/fimLicao.txt"
    putStrLn licaoConcluida
    voltarMenuLicoes

-- loopExercicios :: [Exercicio] -> Int -> IO Int
-- loopExercicios [] cont = return cont
-- loopExercicios (ex:exercicios) cont = do
--     let erros = fazerExercicio ex
--     limparTela
--     loopExercicios exercicios (cont + erros)

-- Função para fazer um exercício específico
fazerExercicio :: Exercicio -> IO (Int, Int)
fazerExercicio ex = do
    let texto = formataLinhasTexto (exercicio ex) " "
    putStrLn ("Exercício " ++ show (Exercicio.id ex) ++ "\n")
    mapM_ putStrLn texto
    
    entrada <- getLine
    let textoCorrigido = formataLinhasTexto (corrigeExercicio entrada (exercicio ex)) " "
        erros = contaErrosExercicios entrada (exercicio ex)
        letras = contaLetrasExercicios (exercicio ex)

    mapM_ putStrLn textoCorrigido
    delay
    return (erros, letras)


-- exibe os desafios
exibirDesafios :: IO ()
exibirDesafios = do
    limparTela
    desafios <- readFile "../dados/arteTexto/desafios.txt"
    putStrLn desafios
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