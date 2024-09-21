:- module(Menu, [imprimeMenu/0]).
:- use_module('./Utils.pl').

imprimeMenu :-
    limparTela,
    ler_arquivo('../dados/arteTxt/menu.txt'),
    ler_entrada(Entrada),
    writeln(Entrada),
    downcase_atom(Entrada, OpcaoMenu),
    opcoesMenuPrincipal(OpcaoMenu).

opcoesMenuPrincipal('l') :- writeln('lições').
opcoesMenuPrincipal('d') :- writeln('desafios').
opcoesMenuPrincipal('t') :- writeln('tutoriais').
opcoesMenuPrincipal('s') :- sair.
opcoesMenuPrincipal(_) :- imprimeMenu.

sair :-
    limparTela,
    ler_arquivo('../dados/arteTxt/sair.txt'),
    halt.

