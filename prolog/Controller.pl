:- module(Controller, [licao/2]).

ex(1, Char, [[Char, "default"], [Char, "default"], [Char, "default"], [Char, "default"],
    [Char, "default"], [Char, "default"], [Char, "default"], [Char, "default"]]).

ex(2, Char1, Char2, [[Char1, "default"], [Char1, "default"], [Char1, "default"], [Char2, "default"],
    [Char1, "default"], [Char1, "default"], [Char1, "default"], [Char2, "default"], [Char1, "default"],
    [Char1, "default"], [Char1, "default"], [Char2, "default"], [Char1, "default"],[Char1, "default"],
    [Char1, "default"], [Char2, "default"]]).

ex(3, Char1, Char2, [[Char1, "default"], [Char2, "default"],[Char1, "default"], [Char2, "default"],
    [Char1, "default"], [Char2, "default"], [Char1, "default"], [Char2, "default"], [Char1, "default"],
    [Char2, "default"], [Char1, "default"], [Char2, "default"], [Char1, "default"], [Char2, "default"],
    [Char1, "default"], [Char2, "default"]]).

ex(4, Char1, Char2, Char3, [[Char1, "default"], [Char1, "default"], [Char3, "default"], [Char2, "default"],
    [Char2, "default"], [Char1, "default"], [Char1, "default"], [Char3, "default"], [Char2, "default"],
    [Char1, "default"], [Char1, "default"], [Char3, "default"], [Char2, "default"], [Char1, "default"],
    [Char1, "default"], [Char3, "default"], [Char2, "default"], [Char1, "default"], [Char1, "default"],
    [Char3, "default"], [Char2, "default"], [Char1, "default"], [Char1, "default"], [Char3, "default"]]).

licao(1, [Ex1, Ex2, Ex3, Ex4]) :-
    ex(1, 'j', Ex1),
    ex(2, 'f', 'j', Ex2),
    ex(3, ' ', 'j', Ex3),
    ex(4, 'j', 'f', ' ', Ex4).