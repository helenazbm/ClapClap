import Graphics.Vty
import Graphics.Vty.Platform.Unix (mkVty)
import Control.Concurrent (forkIO, threadDelay)
import Control.Monad (forever, when)
import Data.IORef

main :: IO ()
main = do
    -- Cria uma referência para armazenar a string de entrada
    inputRef <- newIORef ""
    -- Cria a configuração do terminal
    vty <- mkVty defaultConfig
    -- Fork uma thread para ler eventos de teclado
    _ <- forkIO $ readEvents vty inputRef
    -- Executa o loop principal
    runMainLoop vty inputRef

-- Função para ler eventos de teclado e atualizar a entrada
readEvents :: Vty -> IORef String -> IO ()
readEvents vty inputRef = forever $ do
    e <- nextEvent vty
    case e of
        EvKey (KChar c) _ -> do
            -- Atualiza a entrada quando uma tecla é pressionada
            modifyIORef inputRef (\str -> str ++ [c])
            -- Limpa a tela e desenha a nova entrada
            updateDisplay vty inputRef
        EvKey KBS _ -> do
            -- Remove o último caractere se a tecla Backspace for pressionada
            modifyIORef inputRef (\str -> if null str then str else init str)
            updateDisplay vty inputRef
        EvKey KEsc _ -> do
            shutdown vty
            return ()
        _ -> return ()

-- Função para atualizar a tela com a nova entrada
updateDisplay :: Vty -> IORef String -> IO ()
updateDisplay vty inputRef = do
    -- String alvo para comparação
    let target = "exemplo"
    -- Obtém a entrada atual
    input <- readIORef inputRef
    -- Verifica se a entrada está correta até o ponto atual
    let correct = take (length input) target == input
    -- Exibe a entrada ou a mensagem de erro
    let displayStr = if correct
                     then input
                     else input ++ " <- Erro: caractere incorreto!"
    -- Atualiza a tela com a entrada ou mensagem de erro
    update vty (picForImage (string defAttr displayStr))
    -- Verifica se a string completa foi digitada corretamente
    when (input == target) $ do
        -- Se a entrada for igual a "exemplo", imprime uma mensagem
        update vty (picForImage (string defAttr "String correta digitada!"))
    -- Atualiza a tela
    refresh vty

-- Função para executar o loop principal
runMainLoop :: Vty -> IORef String -> IO ()
runMainLoop vty inputRef = forever $ do
    -- Atualiza a tela a cada 100 milissegundos
    threadDelay 100000
    updateDisplay vty inputRef