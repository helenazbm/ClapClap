:- module(Avaliacao, [conta_erros_exercicio/2, conta_letras_licao/2, calcula_precisao_licao/3, exibe_estrelas_licao/2, conta_palavras_desafio/2, conta_palavras_corretas_desafio/3, calcula_precisao_desafio/3, calcula_wpm/3, exibe_estrelas_desafio/3]).

:- use_module('./Utils.pl').

conta_letras([], 0).
conta_letras([_,_|Resto], Total) :-
    conta_letras(Resto, TotalResto),
    Total is TotalResto + 1.

conta_letras_licao(Exercicios, TotalLetras) :-
    flatten(Exercicios, Licao),
    conta_letras(Licao, TotalLetras).

conta_erros_exercicio([], 0).
conta_erros_exercicio([[_, "vermelho"]|Resto], Total) :-
    conta_erros_exercicio(Resto, TotalResto),
    Total is TotalResto + 1.
conta_erros_exercicio([[_, "verde"]|Resto], Total) :-
    conta_erros_exercicio(Resto, TotalResto),
    Total is TotalResto.

calcula_precisao_licao(TotalLetras, TotalErros, Precisao) :-
    Precisao is 100 * (TotalLetras - TotalErros) / TotalLetras.

exibe_estrelas_licao(Precisao, _) :-
    Precisao < 20.0,
    ler_arquivo("../dados/arteTxt/avaliacoes/zeroEstrela.txt"),
    insere_espaços(68, Espaços),
    format('~sSua precisão de acertos foi de: ~2f%', [Espaços, Precisao]),
    insere_espaços(60, Espaços2),
    format('\n\n~s * Pressione Enter para voltar ao Menu de Lições *', [Espaços2]).
exibe_estrelas_licao(Precisao, _) :-
    Precisao =< 60.0,
    ler_arquivo("../dados/arteTxt/avaliacoes/licao/umaEstrela.txt"),
    insere_espaços(66, Espaços),
    format('~sSua precisão de acertos foi de: ~2f%', [Espaços, Precisao]),
    insere_espaços(60, Espaços2),
    format('\n\n~s * Pressione Enter para voltar ao Menu de Lições *', [Espaços2]).
exibe_estrelas_licao(Precisao, _) :-
    Precisao =< 90.0,
    ler_arquivo("../dados/arteTxt/avaliacoes/duasEstrelas.txt"),
    insere_espaços(66, Espaços),
    format('~sSua precisão de acertos foi de: ~2f%', [Espaços, Precisao]),
    insere_espaços(60, Espaços2),
    format('\n\n~s * Pressione Enter para voltar ao Menu de Lições *', [Espaços2]).
exibe_estrelas_licao(Precisao, _) :-
    ler_arquivo("../dados/arteTxt/avaliacoes/licao/tresEstrelas.txt"),
    insere_espaços(64, Espaços),
    format('~sSua precisão de acertos foi de: ~2f%', [Espaços, Precisao]),
    insere_espaços(60, Espaços2),
    format('\n\n~s * Pressione Enter para voltar ao Menu de Lições *', [Espaços2]).

conta_palavras_desafio(PalavrasEntrada, PalavrasDigitadas) :-
    length(PalavrasEntrada, PalavrasDigitadas).

conta_palavras_corretas_desafio(_, [], 0).
conta_palavras_corretas_desafio([PalavraFrase|RestoFrase], [PalavraEntrada|RestoEntrada],  PalavrasCorretas) :- 
    conta_palavras_corretas_desafio(RestoFrase, RestoEntrada, AcertosResto),
    (PalavraFrase == PalavraEntrada ->
        PalavrasCorretas is AcertosResto + 1;
        PalavrasCorretas is AcertosResto).

calcula_precisao_desafio(PalavrasDigitadas, PalavrasCorretas, Precisao) :-
    Precisao is 100 * PalavrasCorretas / PalavrasDigitadas.

calcula_wpm(PalavrasDigitadas, Tempo, Wpm) :-
    Wpm is (PalavrasDigitadas * 60) // Tempo.

exibe_estrelas_desafio(Wpm, Precisao, Estrelas) :-
    (Precisao < 20.0 ; Wpm < 20),
    insere_espaços(60, Espaços),
    format('~sSua  velocidade foi de: ~w wpm com ~2f% de precisão.\n\n\n', [Espaços, Wpm, Precisao]),
    ler_arquivo("../dados/arteTxt/avaliacoes/zeroEstrela.txt"),
    insere_espaços(60, Espaços2),
    format('\n~s * Pressione Enter para ver o ranking *', [Espaços2]).
exibe_estrelas_desafio(Wpm, Precisao, Estrelas) :-
    (Precisao =< 60.0 ; Wpm =< 30),
    insere_espaços(60, Espaços),
    format('~sSua  velocidade foi de: ~w wpm com ~2f% de precisão.\n\n\n', [Espaços, Wpm, Precisao]),
    ler_arquivo("../dados/arteTxt/avaliacoes/desafio/umaEstrela.txt"),
    insere_espaços(60, Espaços2),
    format('\n~s * Pressione Enter para ver o ranking *', [Espaços2]).
exibe_estrelas_desafio(Wpm, Precisao, Estrelas) :-
    (Precisao =< 90.0 ; Wpm =< 40),
    insere_espaços(60, Espaços),
    format('~sSua  velocidade foi de: ~w wpm com ~2f% de precisão.\n\n\n', [Espaços, Wpm, Precisao]),
    ler_arquivo("../dados/arteTxt/avaliacoes/duasEstrelas.txt"),
    insere_espaços(60, Espaços2),
    format('\n~s * Pressione Enter para ver o ranking *', [Espaços2]).
exibe_estrelas_desafio(Wpm, Precisao, Estrelas) :-
    (Precisao > 90.0 ; Wpm > 40),
    insere_espaços(60, Espaços),
    format('~sSua  velocidade foi de: ~w wpm com ~2f% de precisão.\n\n\n', [Espaços, Wpm, Precisao]),
    ler_arquivo("../dados/arteTxt/avaliacoes/desafio/tresEstrelas.txt"),
    insere_espaços(60, Espaços2),
    format('\n~s * Pressione Enter para ver o ranking *', [Espaços2]).