/* Project:
8Queen proplem solving
with constrain satisfaction and first depth algorethm

Team:

Ahmed Mohamed Fahim Haggag
Ahmed Mostafa Mohamed Fahmy
Eslam Ali Ibrahim

*/
% Date: 17/5/2016

%------------------------------------
% Please read code from bottom to up
%------------------------------------

% Program  :

 % line in middel
 mideline(0):-write('|'),nl,!.
 mideline(L):-S is L-1,write('|----'),mideline(S).

 % shwo qween in row
 show2(Y,I,S) :- Y =:= I-S, !, write(' XX ').
 show2(_,_,_) :-  write('    ').
 
 % drow Qweens  lines
 drowRow([_|_],_,0):-nl,!.
 drowRow([X,Y],I,L):-S is L-1,show2(Y,I,S), write('|'),drowRow([X,Y],I,S).
 
 % table
 table([[X,Y]|_],I,1):-!,write('|'),drowRow([X,Y],I,I).
 table([[X,Y]|T],I,L):-S is L-1, write('|'),drowRow([X,Y],I,I),mideline(I),table(T,I,S).
 
 % first and last lines
 line(1):-!,write('----').
 line(L):-S is L-1,write('-----'),line(S).
 
 % Graphic drow
 graph(Pre,L):- write(' '),line(L),nl,table(Pre,L,L),write(' '),line(L),nl.


 % Assin row to queen position
 row(X,[X|_]).
 row(X,[_|Z]):-
 row(X,Z).

 % constrains function
 constraint([_|_],[]).
 constraint([X,Y],[[X1,Y1]|Tail]):- Y=\=Y1, abs(Y1-Y)=\=abs(X1-X), constraint([X,Y],Tail).

 % main function
 solution([],[_|_]).
 solution([[X,Y]|Tail],L):- solution(Tail,L),row(Y,L), constraint([X,Y],Tail).


 % get list of rows
 to_RowList(0,A,A):-!.
 to_RowList(H,T,Final_l) :-S is H-1, to_RowList(S,[H|T],Final_l).

 % get ordered pair list of queen position
 orderedPair_l([],_,X,X).
 orderedPair_l([Row|T],Col,X,FinalPair_l):- Z is Col-1, orderedPair_l(T,Z,[[Col,Row]|X],FinalPair_l).

 play(Queens_l):-length(Queens_l,Length),to_RowList(Length,[],Rows_l),
                   orderedPair_l(Queens_l,Length,[],Pairs_l),
                        solution(Pairs_l,Rows_l),graph(Pairs_l,Length).




/*
Goal
?- play([any no. of Qween Variables]).
?- play([A,B,C,D,E,F,G,H]).
?- play([A,B,C,D]).
*/



