:- module(Controller, [licao/3]).

ex(1, Char, 
    [[Char, "default"], [Char, "default"], [Char, "default"], [Char, "default"],
    [Char, "default"], [Char, "default"], [Char, "default"], [Char, "default"]]).

ex(2, Char1, Char2,
    [[Char1, "default"], [Char1, "default"], [Char1, "default"], [Char2, "default"], 
    [Char1, "default"], [Char1, "default"], [Char1, "default"], [Char2, "default"],
    [Char1, "default"], [Char1, "default"], [Char1, "default"], [Char2, "default"],
    [Char1, "default"],[Char1, "default"], [Char1, "default"], [Char2, "default"]]).

ex(3, Char1, Char2, 
    [[Char1, "default"], [Char2, "default"],[Char1, "default"], [Char2, "default"],
    [Char1, "default"], [Char2, "default"], [Char1, "default"], [Char2, "default"],
    [Char1, "default"], [Char2, "default"], [Char1, "default"], [Char2, "default"],
    [Char1, "default"], [Char2, "default"], [Char1, "default"], [Char2, "default"]]).

ex(4, Char1, Char2, Char3, 
    [[Char1, "default"], [Char1, "default"], [Char3, "default"], [Char2, "default"],
    [Char2, "default"], [Char1, "default"], [Char1, "default"], [Char3, "default"], [Char2, "default"],
    [Char1, "default"], [Char1, "default"], [Char3, "default"], [Char2, "default"], [Char1, "default"],
    [Char1, "default"], [Char3, "default"], [Char2, "default"], [Char1, "default"], [Char1, "default"],
    [Char3, "default"], [Char2, "default"], [Char1, "default"], [Char1, "default"], [Char3, "default"]]).

ex(5, Char1, Char2, Char3, [[Char1, "default"],
    [Char1, "default"], [Char1, "default"], [Char2, "default"], [Char2, "default"],
    [Char2, "default"], [Char3, "default"], [Char3, "default"], [Char3, "default"]]).

ex(6, Char1, Char2, Char3, Char4, Char5, Char6, Char7,
    [[Char1, "default"], [Char2, "default"], [Char3, "default"], [Char4, "default"],
    [Char5, "default"], [Char6, "default"], [Char7, "default"]]).

ex(7, Char1, Char2, Char3, Char4, [[Char1, "default"], 
    [Char2, "default"], [Char3, "default"], [Char4, "default"], [Char1, "default"],
    [Char2, "default"], [Char2, "default"], [Char3, "default"], [Char4, "default"],
    [Char4, "default"]]).

licao(1, [Ex1, Ex2, Ex3, Ex4], "../dados/arteTxt/licoes/licao1.txt") :-
    ex(1, 'j', Ex1),
    ex(2, 'f', 'j', Ex2),
    ex(3, ' ', 'j', Ex3),
    ex(4, 'j', 'f', ' ', Ex4).

licao(2, [Ex1, Ex2, Ex3, Ex4], "../dados/arteTxt/licoes/licao2.txt") :- 
    ex(1, 'u', Ex1),
    ex(2, 'r', 'u', Ex2),
    ex(3, 'u', 'k', Ex3),
    ex(4, 'r', 'u', 'k', Ex4).

licao(3, [Ex1, Ex2, Ex3, Ex4], "../dados/arteTxt/licoes/licao3.txt") :- 
    ex(1, 'd', Ex1),
    ex(2, 'd', 'i', Ex2),
    ex(3, 'e', 'i', Ex3),
    ex(4, 'd', 'e', 'i', Ex4).

licao(4,[Ex1, Ex2, Ex3, Ex4], "../dados/arteTxt/licoes/licao4.txt") :- 
    ex(1, 'c', Ex1),
    ex(2, 'g', 'n', Ex2),
    ex(3, 'n', 'c', Ex3),
    ex(4, 'c', 'g', 'n', Ex4).

licao(5,[Ex1, Ex2, Ex3, Ex4, Ex5, Ex6, Ex7], "../dados/arteTxt/licoes/licao5.txt") :- 
    ex(5, 'j','f', 'u', Ex1),
    ex(5, 'r', 'k', 'd', Ex2),
    ex(5, 'e', 'i','c', Ex3),
    ex(5, 'g', 'n', 'j', Ex4),
    ex(6, 'j', ' ', 'f',' ', 'u', ' ', 'r', Ex5),
    ex(6, 'k', ' ', 'd',' ', 'e', ' ', 'i', Ex6),
    ex(6, 'g', ' ', 'n', ' ', 'j', ' ', 'f', Ex7).

licao(6,[Ex1, Ex2, Ex3, Ex4], "../dados/arteTxt/licoes/licao6.txt") :- 
    ex(1, 't', Ex1),
    ex(2, 't', 'l', Ex2),
    ex(3, 's', 'l', Ex3),
    ex(4, 't', 's', 'l', Ex4).

licao(7, [Ex1, Ex2, Ex3, Ex4], "../dados/arteTxt/licoes/licao7.txt") :- 
    ex(1, 'o', Ex1),
    ex(2, 'b', 'o', Ex2),
    ex(3, 'o', 'a', Ex3),
    ex(4, 'o', 'b', 'a', Ex4).

licao(8, [Ex1, Ex2, Ex3, Ex4], "../dados/arteTxt/licoes/licao8.txt") :- 
    ex(1, 'v', Ex1),
    ex(2, 'v', 'm', Ex2),
    ex(3, 'v', 'h', Ex3),
    ex(4, 'v', 'h', 'm', Ex4).

%que erro é esse
licao(9, [Ex1, Ex2, Ex3, Ex4, Ex5], "../dados/arteTxt/licoes/licao9.txt") :- 
    ex(2, ',', 'k', Ex1),
    ex(1, '.', Ex2),
    ex(3, '.', 'l', Ex3),
    ex(4, 'o', 'b', 'a', Ex4),
    ex(7, 'l', '.', 'k', ' ', Ex5).

licao(10, [Ex1, Ex2, Ex3, Ex4, Ex5, Ex6, Ex7], "../dados/arteTxt/licoes/licao10.txt" ) :-
    ex(5, 't', 's', 'l', Ex1),
    ex(5, 'o', 'b','a', Ex2),
    ex(5, 'v', 'h', 'm', Ex3),
    ex(5, '.', '.', 't', Ex4),
    ex(6, 't', '.', 's',',', 'l', '.', 'h', Ex5),
    ex(6, 'b', '.', 'a', '.', 'h', '.', 'o', Ex6),
    ex(6, 'm', ',', 'o', ',', 't', ',', 'v', Ex7).

licao(11, [Ex1, Ex2, Ex3, Ex4], "../dados/arteTxt/licoes/licao11.txt") :-
    ex(1, 'w', Ex1),
    ex(2, 'w', ';', Ex2),
    ex(3, ';', 'x', Ex3),
    ex(4, 'w', 'x', ';', Ex4).

licao(12, [Ex1, Ex2, Ex3, Ex4, Ex5, Ex6, Ex7, Ex8, Ex9], "../dados/arteTxt/licoes/licao12.txt") :-
    ex(1, 'ç', Ex1),
    ex(1, ' ', Ex2),
    ex(1, 'é', Ex3),
    ex(2, 'ç', 'á', Ex4),
    ex(2, 'é', 'ç', Ex5),
    ex(1, '~', Ex6),
    ex(2, 'ã', 'ç', Ex7),
    ex(3, 'õ', 'á', Ex8),
    ex(4, 'ç', 'á', 'é', Ex9).

licao(13, [Ex1, Ex2, Ex3, Ex4, Ex5, Ex6, Ex7, Ex8], "../dados/arteTxt/licoes/licao13.txt") :-
    ex(1, ' ', Ex1),
    ex(1, 'à', Ex2),
    ex(2, 'à', 'è', Ex3),
    ex(1, '^', Ex4),
    ex(1, 'ô', Ex5),
    ex(2, 'à', 'ô', Ex6),
    ex(4, 'à', 'ê', 'ô', Ex7),
    ex(4, 'è', 'ô', 'â', Ex8).

licao(14, [Ex1, Ex2, Ex3, Ex4], "../dados/arteTxt/licoes/licao14.txt") :-
    ex(1, 'q', Ex1),
    ex(2, 'y', 'q', Ex2),
    ex(3, 'q', 'p', Ex3),
    ex(4, 'q', 'y', 'p', Ex4).

licao(15, [Ex1, Ex2, Ex3, Ex4], "../dados/arteTxt/licoes/licao15.txt") :-
    ex(1, 'z', Ex1),
    ex(2, 'z', 'y', Ex2),
    ex(3, 'p', 'z', Ex3),
    ex(4, 'z', 'y', 'p', Ex4).
