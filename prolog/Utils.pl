:- module(Utils, [limpar_tela/0, delay/0,ler_entrada/1, ler_arquivo/1, ler_instrucao/1, concatena_strings/2, unlines/2, lines/2, insere_espaços/2, replace_substring/4]).

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

    ler_instrucao(NomeArquivo) :-
    open(NomeArquivo, read, Fluxo),
    ler_linhas_instrucao(Fluxo),
    close(Fluxo).

ler_linhas_instrucao(Fluxo) :-
    read_line_to_string(Fluxo, Linha),
    (   Linha \= end_of_file
    ->  aplica_cor_instrucao(Linha, LinhaColorida),
        writeln(LinhaColorida),
        ler_linhas_instrucao(Fluxo)
    ;   true
    ).

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

insere_espaços(0, '').
insere_espaços(N, Espaços) :-
    N > 0,
    N1 is N - 1,
    insere_espaços(N1, EspaçosAnteriores),
    string_concat(' ', EspaçosAnteriores, Espaços).

replace_substring(String, To_Replace, Replace_With, Result) :-
    sub_string(String, Before, _, After, To_Replace),
    sub_string(String, 0, Before, _, Prefix),
    sub_string(String, _, After, 0, Suffix),
    string_concat(Prefix, Replace_With, Temp),
    string_concat(Temp, Suffix, Result).