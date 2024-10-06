:- module(Utils, [limpar_tela/0, delay/0,ler_entrada/1, ler_arquivo/1, concatena_strings/2, unlines/2, lines/2]).

:- use_module('./Sprites.pl').

limpar_tela :-
    shell('clear').

delay :-
    sleep(1).

ler_entrada(Result) :-
    read_line_to_codes(user_input, Codes),
    string_codes(Result, Codes).

ler_arquivo(NomeArquivo) :-
    open(NomeArquivo, read, Fluxo),
    ler_linhas(Fluxo),
    close(Fluxo).

ler_linhas(Fluxo) :-
    read_line_to_string(Fluxo, Linha),
    (   Linha \= end_of_file
    ->  writeln(Linha),
        ler_linhas(Fluxo)
    ;   true
    ).

concatena_strings([], "").
concatena_strings([H], H).
concatena_strings([H|T], R) :-
  concatena_strings(T, R2), !,
  atom_concat(H, R2, R).

unlines(Strings, R) :- atomic_list_concat(Strings, '\n', R).
lines(String, Lines) :- atomic_list_concat(Lines, '\n', String).
