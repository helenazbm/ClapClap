:- module(Desafio, [inicia_desafio/1]).
:- use_module(library(ansi_term)).
:- use_module('./Utils.pl').

frase_aleatoria("\nO paradigma funcional é um estilo de programação onde o foco está em usar funções para resolver problemas. Imagine uma função como uma pequena caixa preta que recebe um input, faz algum tipo de cálculo ou processamento e retorna um output. O que torna o paradigma funcional especial é que, em vez de mudar o estado do programa ou dos dados, ele usa funções que operam sobre entradas e retornam saídas sem modificar nada fora delas. Isso ajuda a evitar muitos erros comuns, pois as funções são independentes e não têm efeitos colaterais. Por exemplo, se você tem uma função que soma dois números, sempre que você a chama com os mesmos números, ela sempre retornará o mesmo resultado, não importa quando ou onde você a use. Esse estilo de programação é muito útil em projetos grandes, pois facilita o teste e a manutenção do código. Linguagens como Haskell são conhecidas por adotar o paradigma funcional, oferecendo um ambiente onde o código é mais previsível e mais fácil de entender. Outro benefício do paradigma funcional é que ele facilita a criação de código paralelo, pois funções independentes podem ser executadas simultaneamente sem causar problemas. Em resumo, o paradigma funcional é uma abordagem que torna o desenvolvimento de software mais organizado e menos propenso a erros, utilizando funções puras e evitando mudanças inesperadas no estado dos dados.").
frase_aleatoria("\nO paradigma imperativo é uma maneira de programar onde você dá instruções passo a passo para o computador seguir. Imagine que você está seguindo uma receita de bolo: cada passo deve ser seguido em uma ordem específica para obter o resultado desejado. Da mesma forma, na programação imperativa, você escreve um conjunto de comandos que o computador executa um após o outro. Isso é muito intuitivo porque é semelhante à forma como normalmente pensamos sobre resolver problemas. Linguagens como C e Java utilizam o paradigma imperativo, permitindo que você controle detalhadamente o fluxo do programa. Por exemplo, você pode usar loops para repetir um conjunto de instruções e condicionais para tomar decisões baseadas em testes específicos. No entanto, conforme os programas se tornam maiores e mais complexos, pode ser difícil gerenciar o estado do programa, pois ele muda à medida que as instruções são executadas. Isso pode levar a bugs e comportamentos inesperados se o estado não for bem controlado. Para lidar com esses problemas, algumas linguagens imperativas modernas oferecem recursos que ajudam a organizar o código e torná-lo mais fácil de entender. Apesar desses desafios, o paradigma imperativo é amplamente utilizado devido à sua flexibilidade e capacidade de oferecer controle preciso sobre a execução dos programas.").
frase_aleatoria("\nO paradigma lógico é uma abordagem de programação onde você define regras e fatos e deixa o computador encontrar a solução para o problema. Em vez de especificar cada passo a ser seguido, você descreve o problema em termos de regras e o sistema usa essas regras para deduzir a resposta. Imagine que você está jogando um jogo de tabuleiro onde você define as regras e o computador precisa encontrar a melhor jogada com base nessas regras. Linguagens como Prolog utilizam o paradigma lógico para resolver problemas complexos que envolvem regras e relações entre dados. Por exemplo, você pode definir regras que descrevem a relação entre diferentes entidades e usar o sistema para fazer perguntas sobre essas relações. O sistema tenta encontrar respostas que se encaixem nas regras definidas. Esse estilo de programação é especialmente útil para problemas onde a lógica e a dedução são mais importantes do que a sequência específica de passos a serem seguidos. A programação lógica pode ser um pouco diferente do que muitas pessoas estão acostumadas, mas oferece uma maneira poderosa e flexível de resolver problemas complexos.").
frase_aleatoria("\nHaskell é uma linguagem de programação que se destaca por adotar o paradigma funcional. Isso significa que, em vez de mudar o estado do programa, Haskell foca em usar funções para processar dados. Em Haskell, você escreve código que define funções matemáticas e transforma dados sem alterar o estado do programa. Essa abordagem ajuda a tornar o código mais previsível e fácil de entender, pois as funções em Haskell sempre retornam os mesmos resultados para as mesmas entradas. Outra característica importante de Haskell é seu sistema de tipos avançado, que ajuda a identificar erros no código antes mesmo de ele ser executado. Haskell também facilita a criação de código paralelo, pois funções independentes podem ser executadas ao mesmo tempo sem causar problemas. Embora possa levar algum tempo para se acostumar com o estilo funcional, Haskell oferece uma maneira poderosa e elegante de programar, que pode ser especialmente útil em projetos grandes e complexos. Se você está interessado em explorar a programação funcional, Haskell é uma excelente escolha para aprender e aplicar esses conceitos de forma prática.").
frase_aleatoria("\nProlog é uma linguagem de programação que se baseia na lógica para resolver problemas. Em vez de especificar cada passo do processo, você define regras e fatos, e o computador usa essas definições para encontrar soluções. Imagine que você está tentando resolver um quebra-cabeça e tem algumas peças e regras sobre como elas devem se encaixar. Prolog funciona de forma semelhante: você define as regras e o sistema tenta encontrar uma solução que se encaixe nessas regras. Esse estilo de programação é muito útil para problemas que envolvem relações complexas entre dados, como sistemas de recomendação ou jogos. Prolog usa um mecanismo chamado retrocesso (backtracking) para tentar diferentes caminhos até encontrar uma solução que satisfaça todas as regras definidas. Embora possa ser um pouco diferente do que você está acostumado se você vem de um fundo de programação imperativa, Prolog oferece uma abordagem única e poderosa para resolver problemas que envolvem lógica e regras.").

exibir_frase(Frase) :-
    findall(F, frase_aleatoria(F), Frases),
    random_member(Frase, Frases),
    writeln(Frase).

split_string_em_palavras(Frase, Palavras) :-
    split_string(Frase, " ", "", Palavras).

comparar_frase(Frase, Entrada) :-
    split_string_em_palavras(Frase, PalavrasFrase),
    split_string_em_palavras(Entrada, PalavrasEntrada),
    colorir_palavras(PalavrasFrase, PalavrasEntrada).

colorir_palavras([], []).
colorir_palavras([PalavraFrase|RestoFrase], [PalavraEntrada|RestoEntrada]) :-
    (PalavraFrase == PalavraEntrada ->
        ansi_format([fg(green)], '~w ', [PalavraFrase]);
        ansi_format([fg(red)], '~w ', [PalavraFrase])), 
    colorir_palavras(RestoFrase, RestoEntrada).

colorir_palavras([PalavraFrase|RestoFrase], []) :-
    ansi_format([fg(red)], '~w ', [PalavraFrase]),
    colorir_palavras(RestoFrase, []).

tempo_desafio(um_minuto, 60).
tempo_desafio(dois_minutos, 120).
tempo_desafio(tres_minutos, 180).

inicia_desafio(Desafio) :-
    limpar_tela,
    tempo_desafio(Desafio, Tempo),
    writeln('Prepare-se para o desafio!'),
    format('Você terá ~w segundos para digitar o texto abaixo.~n', [Tempo]),
    delay,
    desafio(Tempo).

desafio(Tempo) :-
    exibir_frase(Frase), 
    get_time(Inicio),
    read_line_to_string(user_input, Entrada),
    loop_desafio(Inicio, Tempo, Frase, Entrada).

loop_desafio(Inicio, Tempo, Frase, Entrada) :-
    get_time(Agora),
    Duracao is Agora - Inicio,
    (Duracao < Tempo -> 
        loop_desafio(Inicio, Tempo, Frase, Entrada)
    ; 
        writeln('\nTempo esgotado! Pressione Enter para ver o seu resultado:'),
        comparar_frase(Frase, Entrada)
    ).


menu :-
    writeln('Escolha o tempo de desafio:'),
    writeln('1. 1 minuto'),
    writeln('2. 2 minutos'),
    writeln('3. 3 minutos'),
    read(Escolha),
    (Escolha == 1 -> desafio(60);
     Escolha == 2 -> desafio(120);
     Escolha == 3 -> desafio(180);
     writeln('Escolha inválida.'), menu).


