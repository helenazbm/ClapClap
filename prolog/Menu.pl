:- module(Menu, [imprime_menu/0, exibe_licao/1, lista_licoes/0, lista_desafios/0]).

:- use_module('./Utils.pl').
:- use_module('./Controller.pl').
:- use_module('./Licao.pl').
:- use_module('./Sprites.pl').
:- use_module('./Desafio.pl').

imprime_menu :-
    limpar_tela,
    ler_arquivo('../dados/arteTxt/menu.txt'),
    ler_entrada(Entrada),
    downcase_atom(Entrada, OpcaoMenu),
    opcoes_menu_principal(OpcaoMenu).

opcoes_menu_principal('l') :- lista_licoes.
opcoes_menu_principal('d') :- lista_desafios.
opcoes_menu_principal('t') :- exibe_tutorial.
opcoes_menu_principal('s') :- sair.
opcoes_menu_principal(_) :- imprime_menu.


lista_licoes :-
    limpar_tela,
    conta_licoes_concluidas(Cont),
    exibe_progresso(Cont, Progresso),
    writeln(Progresso),
    le_status(Dados),
    exibe_licoes_concluidas(Dados, LicoesConcluidas),
    writeln(""),
    writeln(LicoesConcluidas),
    ler_arquivo('../dados/arteTxt/licoes.txt'),
    ler_entrada(Entrada),
    (  Entrada = "" -> imprime_menu; number_string(NumeroLicao, Entrada),
        (   NumeroLicao >= 1, NumeroLicao =< 15 -> exibe_licao(NumeroLicao))
        ; lista_licoes).

exibe_licao(NumeroLicao) :-
    limpar_tela,
    licao(NumeroLicao, _Exercicios, Arquivo),
    ler_arquivo(Arquivo),
    ler_entrada(Entrada),
    downcase_atom(Entrada, Opcao),
    ( Entrada = "" -> lista_licoes; Opcao = 'i' -> inicia_licao(NumeroLicao)
    ; exibe_licao(NumeroLicao)).
    
lista_desafios :-
    limpar_tela,
    ler_arquivo('../dados/arteTxt/desafios.txt'),
    ler_entrada(Entrada),
    le_ranking(Dados),
    ( Entrada = "" -> imprime_menu; Entrada = "r" -> 
        limpar_tela,
        exibe_ranking(Dados, Ranking),
        writeln(Ranking), ler_entrada(_), lista_desafios;
    number_string(NumeroDesafio, Entrada), opcoes_menu_desafios(NumeroDesafio)).

opcoes_menu_desafios(1) :- inicia_desafio(um_minuto).
opcoes_menu_desafios(2) :- inicia_desafio(dois_minutos).
opcoes_menu_desafios(3) :- inicia_desafio(tres_minutos).
opcoes_menu_desafios(_) :- lista_desafios.

exibe_tutorial:-
    limpar_tela,
    ler_arquivo('../dados/arteTxt/tutorial.txt'),
    ler_entrada(_),
    imprime_menu.

sair :-
    limpar_tela,
    ler_arquivo('../dados/arteTxt/sair.txt'),
    halt.