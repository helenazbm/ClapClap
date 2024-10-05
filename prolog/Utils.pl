:- module(Utils, [limpar_tela/0, delay/0,ler_entrada/1, ler_arquivo/1, map/3, concatena_strings/2, unlines/2, lines/2]).

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

map([], _, []).
map([H|T], Transformation, [H2|T2]) :-
    call(Transformation, H, H2),
    map(T, Transformation, T2).

concatena_strings([], '').
concatena_strings([X], X).
concatena_strings([Head|Tail], Result) :-
  concatena_strings(Tail, R2), !,
  string_concat(Head, R2, Result).

unlines(Strings, Result) :- atomic_list_concat(Strings, '\n', Result).
lines(String, Lines) :- atomic_list_concat(Lines, '\n', String).
