{-# LANGUAGE OverloadedStrings #-}

module Desafio where

import Text.Printf
import Util (limparTela)
import Control.Monad (when)
import Data.List (intercalate)
import Data.List.Split (splitOn)
import System.Random (randomRIO)
import System.IO (hFlush, stdout)
import Control.Concurrent.Async (race)
import Control.Concurrent (threadDelay, forkIO)
import System.Directory (renameFile, removeFile)
import Sprites (getCor, colorirPalavra, formataRanking)
import Control.Concurrent.MVar (MVar, newEmptyMVar, putMVar, takeMVar, tryTakeMVar, isEmptyMVar)



data Desafio = UmMinuto | DoisMinutos | CincoMinutos

tempoDesafio :: Desafio -> Int
tempoDesafio UmMinuto     = 60
tempoDesafio DoisMinutos  = 120
tempoDesafio CincoMinutos = 300

frases :: [String]
frases = 
    [
    "\no paradigma funcional é um estilo de programação onde o foco está em usar funções para resolver problemas. imagine uma função como uma pequena caixa preta que recebe um input, faz algum tipo de cálculo ou processamento e retorna um output. o que torna o paradigma funcional especial é que, em vez de mudar o estado do programa ou dos dados, ele usa funções que operam sobre entradas e retornam saídas sem modificar nada fora delas. isso ajuda a evitar muitos erros comuns, pois as funções são independentes e não têm efeitos colaterais. por exemplo, se você tem uma função que soma dois números, sempre que você a chama com os mesmos números, ela sempre retornará o mesmo resultado, não importa quando ou onde você a use. esse estilo de programação é muito útil em projetos grandes, pois facilita o teste e a manutenção do código. linguagens como haskell são conhecidas por adotar o paradigma funcional, oferecendo um ambiente onde o código é mais previsível e mais fácil de entender. outro benefício do paradigma funcional é que ele facilita a criação de código paralelo, pois funções independentes podem ser executadas simultaneamente sem causar problemas. em resumo, o paradigma funcional é uma abordagem que torna o desenvolvimento de software mais organizado e menos propenso a erros, utilizando funções puras e evitando mudanças inesperadas no estado dos dados.\n",
    "\no paradigma imperativo é uma maneira de programar onde você dá instruções passo a passo para o computador seguir. imagine que você está seguindo uma receita de bolo: cada passo deve ser seguido em uma ordem específica para obter o resultado desejado. da mesma forma, na programação imperativa, você escreve um conjunto de comandos que o computador executa um após o outro. isso é muito intuitivo porque é semelhante à forma como normalmente pensamos sobre resolver problemas. linguagens como C e Java utilizam o paradigma imperativo, permitindo que você controle detalhadamente o fluxo do programa. por exemplo, você pode usar loops para repetir um conjunto de instruções e condicionais para tomar decisões baseadas em testes específicos. no entanto, conforme os programas se tornam maiores e mais complexos, pode ser difícil gerenciar o estado do programa, pois ele muda à medida que as instruções são executadas. isso pode levar a bugs e comportamentos inesperados se o estado não for bem controlado. para lidar com esses problemas, algumas linguagens imperativas modernas oferecem recursos que ajudam a organizar o código e torná-lo mais fácil de entender. apesar desses desafios, o paradigma imperativo é amplamente utilizado devido à sua flexibilidade e capacidade de oferecer controle preciso sobre a execução dos programas.\n",
    "\no paradigma lógico é uma abordagem de programação onde você define regras e fatos e deixa o computador encontrar a solução para o problema. em vez de especificar cada passo a ser seguido, você descreve o problema em termos de regras e o sistema usa essas regras para deduzir a resposta. imagine que você está jogando um jogo de tabuleiro onde você define as regras e o computador precisa encontrar a melhor jogada com base nessas regras. linguagens como prolog utilizam o paradigma lógico para resolver problemas complexos que envolvem regras e relações entre dados. por exemplo, você pode definir regras que descrevem a relação entre diferentes entidades e usar o sistema para fazer perguntas sobre essas relações. o sistema tenta encontrar respostas que se encaixem nas regras definidas. esse estilo de programação é especialmente útil para problemas onde a lógica e a dedução são mais importantes do que a sequência específica de passos a serem seguidos. a programação lógica pode ser um pouco diferente do que muitas pessoas estão acostumadas, mas oferece uma maneira poderosa e flexível de resolver problemas complexos. \n",
    "\nhaskell é uma linguagem de programação que se destaca por adotar o paradigma funcional. isso significa que, em vez de mudar o estado do programa, haskell foca em usar funções para processar dados. em haskell, você escreve código que define funções matemáticas e transforma dados sem alterar o estado do programa. essa abordagem ajuda a tornar o código mais previsível e fácil de entender, pois as funções em haskell sempre retornam os mesmos resultados para as mesmas entradas. outra característica importante de haskell é seu sistema de tipos avançado, que ajuda a identificar erros no código antes mesmo de ele ser executado. haskell também facilita a criação de código paralelo, pois funções independentes podem ser executadas ao mesmo tempo sem causar problemas. embora possa levar algum tempo para se acostumar com o estilo funcional, haskell oferece uma maneira poderosa e elegante de programar, que pode ser especialmente útil em projetos grandes e complexos. se você está interessado em explorar a programação funcional, haskell é uma excelente escolha para aprender e aplicar esses conceitos de forma prática.\n",
    "\nprolog é uma linguagem de programação que se baseia na lógica para resolver problemas. em vez de especificar cada passo do processo, você define regras e fatos, e o computador usa essas definições para encontrar soluções. imagine que você está tentando resolver um quebra-cabeça e tem algumas peças e regras sobre como elas devem se encaixar. prolog funciona de forma semelhante: você define as regras e o sistema tenta encontrar uma solução que se encaixe nessas regras. esse estilo de programação é muito útil para problemas que envolvem relações complexas entre dados, como sistemas de recomendação ou jogos. prolog usa um mecanismo chamado retrocesso para tentar diferentes caminhos até encontrar uma solução que satisfaça todas as regras definidas. embora possa ser um pouco diferente do que você está acostumado se você vem de um fundo de programação imperativa, prolog oferece uma abordagem única e poderosa para resolver problemas que envolvem lógica e regras.\n",
    "\njava é uma linguagem de programação amplamente utilizada que é conhecida por sua capacidade de funcionar em diferentes tipos de dispositivos e sistemas operacionais. isso é possível porque o código java é executado em uma máquina virtual, chamada jvm, que traduz o código para a linguagem do sistema operacional no qual está sendo executado. isso permite que você escreva um programa uma vez e o execute em qualquer lugar. java é uma linguagem orientada a objetos, o que significa que você organiza o código em objetos que representam entidades do mundo real, como uma conta bancária ou um carro. cada objeto pode ter suas próprias características e comportamentos, o que ajuda a criar aplicativos de maneira estruturada e organizada. além disso, java é conhecido por sua robustez e segurança, tornando-o uma escolha popular para o desenvolvimento de aplicativos corporativos, jogos e sistemas de internet. a ampla comunidade e o suporte a muitas bibliotecas e ferramentas fazem do java uma linguagem versátil e poderosa para uma variedade de aplicações.\n",
    "\ninteligência artificial é a tecnologia que permite que máquinas realizem tarefas que normalmente exigiriam inteligência humana. isso inclui atividades como reconhecer rostos em fotos, entender o que estamos dizendo e até mesmo dirigir carros. a ia funciona através de algoritmos que permitem que as máquinas aprendam a partir de dados. por exemplo, um sistema de ia pode ser treinado para identificar diferentes tipos de frutas analisando muitas imagens delas. com o tempo, o sistema melhora sua capacidade de reconhecimento com base em exemplos anteriores. a ia é amplamente utilizada em nosso cotidiano, desde assistentes virtuais como siri e alexa até sistemas de recomendação em plataformas de streaming. ela também está transformando setores como saúde, finanças e manufatura, oferecendo novas maneiras de analisar dados, automatizar processos e melhorar a eficiência. apesar dos avanços, a ia ainda enfrenta desafios, como garantir a privacidade dos dados e lidar com possíveis vieses nos algoritmos. no entanto, à medida que a tecnologia avança, a ia promete transformar ainda mais a forma como interagimos com o mundo ao nosso redor.\n",
    "\num banco de dados é um sistema que armazena informações de forma organizada, permitindo que você acesse, modifique e gerencie esses dados facilmente. pense em um banco de dados como uma enorme planilha onde você pode guardar informações sobre clientes, produtos ou qualquer outro tipo de dado. ele é projetado para ajudar a armazenar grandes quantidades de dados e facilitar a busca e atualização dessas informações. bancos de dados são usados em muitos contextos, desde empresas que precisam gerenciar dados de clientes e transações, até aplicativos que armazenam informações dos usuários. eles são estruturados de forma a garantir que os dados estejam acessíveis e organizados, o que facilita a realização de análises e a geração de relatórios. através de consultas e comandos, você pode obter exatamente as informações de que precisa, de forma rápida e eficiente. isso torna os bancos de dados uma ferramenta essencial para qualquer sistema que envolva grandes volumes de dados.\n",
    "\nsql é a linguagem usada para interagir com bancos de dados. com sql, você pode buscar informações, adicionar novos dados, atualizar registros existentes ou remover dados que não são mais necessários. por exemplo, se você quiser encontrar todos os clientes que compraram um determinado produto, você pode escrever uma consulta sql que faz exatamente isso. sql é uma linguagem poderosa porque permite realizar operações complexas com os dados armazenados em um banco de dados. além disso, sql é projetada para ser fácil de aprender e usar, tornando-a uma ferramenta valiosa para qualquer pessoa que trabalhe com dados. com sql, você pode fazer consultas que ajudam a analisar e entender melhor as informações, facilitando a tomada de decisões baseada em dados. a versatilidade e a eficiência do sql fazem dela uma das linguagens mais importantes para o gerenciamento de dados em muitas indústrias.\n",
    "\nsgbd, ou sistema de gerenciamento de banco de dados, é o software responsável por gerenciar e organizar os dados em um banco de dados. pense em um sgbd como o gerente de um grande arquivo digital que garante que as informações sejam armazenadas de forma segura e acessível. o sgbd cuida de tarefas como garantir que os dados não sejam corrompidos, permitir que múltiplos usuários acessem e atualizem informações ao mesmo tempo e fazer backups para proteger contra perda de dados. ele também fornece uma interface para que você possa interagir com o banco de dados, fazendo consultas, inserções e modificações. exemplos de sgbds incluem mysql, oracle e microsoft sql server. cada um tem suas próprias características e funcionalidades, mas todos têm o objetivo de gerenciar dados de maneira eficiente e confiável. os sgbds são essenciais para aplicações que precisam lidar com grandes volumes de dados e garantir que esses dados estejam organizados e disponíveis quando necessário.\n",
    "\nportas lógicas são componentes fundamentais na eletrônica digital que processam sinais binários, representados pelos números 0 e 1. cada porta lógica realiza uma operação específica, como combinar sinais ou inverter seu valor. por exemplo, uma porta and só produz uma saída de 1 se todas as suas entradas forem 1, enquanto uma porta or produz uma saída de 1 se pelo menos uma de suas entradas for 1. essas portas são usadas para construir circuitos digitais em dispositivos como computadores e smartphones. embora as operações que realizam sejam simples, elas são repetidas milhões de vezes por segundo para realizar tarefas complexas. as portas lógicas são a base da eletrônica digital e são essenciais para o funcionamento de todos os dispositivos eletrônicos modernos, permitindo que eles realizem cálculos, tomem decisões e processem informações.\n",
    "\no sistema binário é a base da computação moderna, utilizando apenas dois dígitos, 0 e 1, para representar todas as informações. cada dígito binário é chamado de bit, e conjuntos de bits são usados para representar dados mais complexos. por exemplo, uma sequência de 8 bits pode representar um caractere de texto, como a letra a. o sistema binário é usado porque é simples e se adapta bem aos circuitos eletrônicos dos computadores, onde os sinais elétricos podem ser facilmente representados como ligados ou desligados. apesar de sua simplicidade, o sistema binário é extremamente poderoso e capaz de representar qualquer tipo de dado digital, desde números e textos até imagens e sons. a capacidade de combinar e manipular bits de maneira eficiente é o que permite que os computadores realizem uma ampla gama de tarefas.\n",
    "\na história da computação é uma jornada fascinante que começou com as primeiras ferramentas para cálculos simples e evoluiu para os poderosos computadores que usamos hoje. as primeiras máquinas de calcular mecânicas foram desenvolvidas para ajudar com operações matemáticas básicas. com o tempo, as calculadoras evoluíram para computadores eletrônicos, que usavam tubos de vácuo para processar informações. o advento dos transistores e circuitos integrados permitiu a criação de computadores menores e mais acessíveis. pioneiros como charles babbage e alan turing foram fundamentais no desenvolvimento dos conceitos básicos da computação, incluindo a ideia de uma máquina programável e o conceito de algoritmos. com o avanço da tecnologia, os computadores se tornaram uma parte essencial da vida cotidiana, influenciando tudo, desde a maneira como trabalhamos até a forma como nos comunicamos e nos divertimos. hoje, os computadores são indispensáveis para a sociedade moderna e continuam a evoluir rapidamente.\n",
    "\nalan turing foi um matemático e cientista da computação britânico, considerado um dos pais da ciência da computação moderna. ele é mais conhecido por desenvolver o conceito de uma máquina teórica, agora chamada de maquina de turing, que ajudou a definir o que é computação e quais problemas podem ser resolvidos por um computador. turing também desempenhou um papel crucial durante a segunda guerra mundial ao decifrar códigos criptografados usados pelos nazistas, o que ajudou a encurtar a guerra. seu trabalho na teoria da computação e na inteligência artificial influenciou profundamente o desenvolvimento de computadores e algoritmos. embora sua vida tenha sido marcada por desafios pessoais e profissionais, o legado de alan turing continua a impactar a tecnologia e a ciência da computação até hoje. seu trabalho estabeleceu as bases para muitas das tecnologias que usamos e dependemos no mundo moderno.\n",
    "\nestruturas de dados são maneiras de organizar e armazenar informações para que sejam fáceis de acessar e modificar. imagine uma caixa de ferramentas com compartimentos para diferentes tipos de ferramentas. da mesma forma, as estruturas de dados ajudam a organizar informações em um computador. a lista é uma estrutura que armazena uma sequência de itens, permitindo adicionar, remover e acessar qualquer item facilmente, como uma lista de compras. a pilha funciona como uma pilha de pratos onde você só pode adicionar ou remover itens do topo, ideal para quando a ordem de entrada e saída é importante. a fila é semelhante a uma fila de pessoas, onde o primeiro a entrar é o primeiro a sair, útil para processos onde a ordem é crucial, como em sistemas de impressão. as árvores são estruturas hierárquicas, como uma árvore genealógica, organizando dados em um formato de ramificação que facilita a busca e a organização. as tabelas hash ajudam a encontrar informações rapidamente, funcionando como um índice em um livro, onde um código é usado para acessar diretamente a informação desejada. cada tipo de estrutura de dados tem suas vantagens e desvantagens, e a escolha certa depende da tarefa específica. compreender essas estruturas é essencial para criar programas que sejam eficientes e funcionem bem, economizando tempo e recursos no processamento de dados.\n",
    "\na orientação a objetos é um estilo de programação que usa objetos para organizar o código. imagine objetos como peças de um quebra-cabeça, onde cada peça tem características e comportamentos específicos. por exemplo, em um sistema de gerenciamento de biblioteca, um objeto pode representar um livro, com atributos como título e autor, e métodos como emprestar e devolver. esses objetos são criados a partir de classes, que são como moldes que definem as características e comportamentos comuns. a encapsulação é um princípio importante, onde cada objeto é responsável por suas próprias informações e ações, tornando o código mais modular e fácil de entender. a herança permite criar novas classes baseadas em classes existentes, compartilhando características e comportamentos, enquanto o polimorfismo permite que objetos diferentes usem a mesma interface de forma diferente, facilitando a extensão e a manutenção do código. a orientação a objetos ajuda a criar software mais organizado e flexível, tornando o desenvolvimento mais eficiente e a manutenção mais simples, permitindo que desenvolvedores construam sistemas complexos de forma mais gerenciável.\n"
    ]

fraseAleatoria :: IO String
fraseAleatoria = do
    index <- randomRIO (0, length frases - 1)
    return (frases !! index)

contarTempo :: Int -> MVar () -> IO ()
contarTempo tempo tempoMVar = do
    threadDelay (tempo * 1000000)  
    putMVar tempoMVar ()  

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

executarDesafio :: Desafio -> MVar () -> IO ()
executarDesafio desafio tempoMVar = do
    let loop = do
            frase <- fraseAleatoria
            putStrLn frase
            hFlush stdout

            resultado <- race (takeMVar tempoMVar) getLine
            case resultado of
                Left _ -> do
                    limparTela
                    putStrLn "\nTempo esgotado! Pressione enter para ver seu resultado."
                    string <- getLine
                    let resultadoFrase = compararFrases frase string
                    putStrLn resultadoFrase
                    putStrLn "\nFim do desafio! Pressione Enter para ver a sua velocidade e precisão."
                    _ <- getLine
                    avaliaDesafio desafio frase string

                Right input -> do
                    limparTela
                    putStrLn "O tempo não esgotou, reinicie o desafio!"
                    getRanking
    loop

avaliaDesafio :: Desafio -> String -> String -> IO()
avaliaDesafio desafio frase string = do
    let numPalavras = contarPalavrasDesafio string
        numPalavrasCorretas = contarPalavrasCorretas frase string
        wpm = calcularWpm (tempoDesafio desafio) numPalavras
        precisao = calcularPrecisaoDesafio numPalavras numPalavrasCorretas
        estrelas = atribuirEstrelasDesafio wpm precisao
        tempo = tempoEmMin (tempoDesafio desafio)
        precisaoFormatada = printf "%.2f" precisao
    
    limparTela
    putStrLn "\n"
    putStrLn $ replicate 60 ' ' ++ "Você fez o desafio de " ++ show tempo  ++ " min."
    putStrLn $ replicate 40 ' ' ++ "Sua velocidade foi de: " ++ show wpm ++ " palavras por minuto com " ++ precisaoFormatada ++ "% de precisão."

    desafioConcluido <- case estrelas of
        0 -> readFile "../dados/avaliacoes/zeroEstrela.txt"
        1 -> readFile "../dados/avaliacoes/desafio/umaEstrela.txt"
        2 -> readFile "../dados/avaliacoes/duasEstrelas.txt"
        3 -> readFile "../dados/avaliacoes/desafio/tresEstrelas.txt"

    putStrLn desafioConcluido

    _ <- getLine
    verificaRecorde tempo wpm
    getRanking

verificaRecorde :: Int -> Int -> IO ()
verificaRecorde tempo wpmUsuario = do
    dadosRankingFiltrado <- filtraRecorde (show tempo)
    let [(id, _, wpmStr)] = dadosRankingFiltrado
        wpmRecorde = read wpmStr :: Int
    
    when (wpmUsuario > wpmRecorde) $ do
        limparTela
        putStrLn "Parabéns, você bateu o recorde! Digite seu nome:"
        nomeNovo <- getLine
        setDadosRanking id nomeNovo (show wpmUsuario)

getRanking :: IO()
getRanking = do
    dadosRanking <- getDadosRanking
    let (id1, nome1, wpm1) : (id2, nome2, wpm2) : (id5, nome5, wpm5) : _ = dadosRanking
    limparTela
    formataRanking id1 nome1 wpm1 id2 nome2 wpm2 id5 nome5 wpm5

getDadosRanking :: IO [(String, String, String)]
getDadosRanking = do
    conteudo <- readFile "../dados/tabela_ranking.txt"
    let linhas = tail $ map (splitOn ";") (lines conteudo)
    return $ map (\[id, nome, wpm] -> (id, nome, wpm)) linhas

filtraRecorde :: String -> IO [(String, String, String)]
filtraRecorde idFiltro = do
    ranking <- getDadosRanking
    return $ filter (\(id, _, _) -> id == idFiltro) ranking

setDadosRanking :: String -> String -> String -> IO()
setDadosRanking id nome wpm = do
    let filePath = "../dados/tabela_ranking.txt"
        tempFilePath = filePath ++ ".tmp"
    
    conteudo <- readFile filePath
    let linhas = lines conteudo
        linhasProcessadas = map (\linha -> atualizarLinha id nome wpm linha) linhas
    
    writeFile tempFilePath (unlines linhasProcessadas)

    renameFile tempFilePath filePath

atualizarLinha :: String -> String -> String -> String -> String
atualizarLinha id nome wpm linha =
    let [idRecorde, nomeRecorde, wpmRecorde] = splitOn ";" linha
    in if idRecorde == id
       then intercalate ";" [id, nome, wpm]
       else linha

iniciarDesafio :: Desafio -> IO ()
iniciarDesafio desafio = do
    limparTela
    let tempo = tempoDesafio desafio
    putStrLn "Prepare-se para o desafio!\n"
    putStrLn $ "Você terá " ++ show tempo ++ " segundos para digitar o texto abaixo."
    threadDelay 2000000
    tempoMVar <- newEmptyMVar
    _ <- forkIO (contarTempo tempo tempoMVar)
    executarDesafio desafio tempoMVar

-- retorna a quantidade de palavras que o usuário digitou (certas e erradas)
contarPalavrasDesafio :: String -> Int
contarPalavrasDesafio input = length (words input)

-- retorna a quantidade de palavras corretas que o usuário digitou 
contarPalavrasCorretas :: String -> String -> Int
contarPalavrasCorretas fraseCorreta fraseDigitada =
    let palavrasCorretas = words fraseCorreta
        palavrasDigitadas = words fraseDigitada
        palavrasCorretasDigitadas = zip palavrasCorretas palavrasDigitadas
        palavrasCorretasCorretas = filter (\(c, d) -> c == d) palavrasCorretasDigitadas
    in length palavrasCorretasCorretas

calcularWpm :: Int -> Int -> Int
calcularWpm tempo palavras = (palavras * 60) `div` tempo

calcularPrecisaoDesafio :: Int -> Int -> Float
calcularPrecisaoDesafio palavrasDigitadas palavrasCorretas = 
    (100.0 * fromIntegral palavrasCorretas) / fromIntegral palavrasDigitadas

atribuirEstrelasDesafio :: Int -> Float -> Int
atribuirEstrelasDesafio ppm precisao
    | precisao < 20.0 || ppm < 20 = 0
    | precisao <= 60.0 || ppm <= 30 = 1
    | precisao <= 90.0 || ppm <= 40 = 2
    | otherwise = 3  

tempoEmMin :: Int -> Int
tempoEmMin tempo = tempo `div` 60