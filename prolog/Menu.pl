:- module(Menu, [imprime_menu/0]).
:- use_module('./Utils.pl').

imprime_menu :-
    limpar_tela,
    ler_arquivo('../dados/arteTxt/menu.txt'),
    ler_entrada(Entrada),
    downcase_atom(Entrada, OpcaoMenu),
    opcoes_menu_principal(OpcaoMenu).

opcoes_menu_principal('l') :- lista_Licoes.
opcoes_menu_principal('d') :- lista_desafios.
opcoes_menu_principal('t') :- exibe_tutorial.
opcoes_menu_principal('s') :- sair.
opcoes_menu_principal(_) :- imprime_menu.


lista_Licoes :-
    limpar_tela,
    ler_arquivo('../dados/arteTxt/licoes.txt'),
    ler_entrada(Entrada),
    (  Entrada = "" -> imprime_menu; number_string(NumeroLicao, Entrada),
        (   NumeroLicao >= 1, NumeroLicao =< 15 -> writeln(['Você escolheu a lição:', NumeroLicao])
        ; lista_Licoes)
    ).
    
lista_desafios :-
    limpar_tela,
    ler_arquivo('../dados/arteTxt/desafios.txt'),
    ler_entrada(Entrada),
    ( Entrada = "" -> imprime_menu; Entrada = "r" -> writeln('Exibir o ranking'); number_string(NumeroDesafio, Entrada), opcoes_menu_desafios(NumeroDesafio)).

opcoes_menu_desafios(1) :- writeln('Desafio 1').
opcoes_menu_desafios(2) :- writeln('Desafio 2').
opcoes_menu_desafios(3) :- writeln('Desafio 3').
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

