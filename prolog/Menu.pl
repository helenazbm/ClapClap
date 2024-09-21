:- module(Menu, [imprime_menu/0]).
:- use_module('./Utils.pl').

imprime_menu :-
    limpar_tela,
    ler_arquivo('../dados/arteTxt/menu.txt'),
    ler_entrada(Entrada),
    downcase_atom(Entrada, OpcaoMenu),
    opcoes_menu_principal(OpcaoMenu).

opcoes_menu_principal('l') :- lista_Licoes.
opcoes_menu_principal('d') :- writeln('desafios').
opcoes_menu_principal('t') :- writeln('tutoriais').
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

sair :-
    limpar_tela,
    ler_arquivo('../dados/arteTxt/sair.txt'),
    halt.

