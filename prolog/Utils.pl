:- module(Utils, [limparTela/0, delay/0,ler_entrada/1, ler_arquivo/1]).

limparTela :-
    shell('clear').

delay :-
    sleep(1).

% lê entrada sem precisar do ponto no final
ler_entrada(Result) :-
    read_line_to_codes(user_input, Codes),
    string_codes(Result, Codes).


% lê um arquivo e imprime seu conteúdo//uso para imprmir os arquivos txt
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
