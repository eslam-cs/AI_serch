% Author:
% Date: 30/04/2016



barrier(1, 8).
barrier(2, 1).
barrier(2, 2).
barrier(2, 4).
barrier(2, 5).
barrier(3, 4).
barrier(3, 7).
barrier(4, 4).
barrier(4, 7).
barrier(4, 8).
barrier(5, 2).

getm(s(X,Y),s(Xn,Yn)):- Xn is X -1,Yn is Y.
getm(s(X,Y),s(Xn,Yn)):- Xn is X   ,Yn is Y +1.
getm(s(X,Y),s(Xn,Yn)):- Xn is X   ,Yn is Y -1.
getm(s(X,Y),s(Xn,Yn)):- Xn is X +1,Yn is Y.




move(s(X,Y),T):-not(barrier(X,Y)),X<6,Y<10,X>0,Y>0 ,\+member(s(X,Y),T).

solv(s(1,9),L):- write(L),show(L).
solv(s(X,Y),L):-getm(s(X,Y),s(Xn,Yn)),move(s(Xn,Yn),L),solv(s(Xn,Yn),[s(X,Y)|L]).



start(s(X,Y)):- solv(s(X,Y),[]).


show(L) :-

nl,write(' ---------------------'), nl,
    write(' | '), show2(L,s(1,1)),
    write(' | '), show2(L,s(2,1)),
    write(' | '), show2(L,s(3,1)),
    write(' | '), show2(L,s(4,1)),
    write(' | '), show2(L,s(5,1)),write(' | '), nl,
write(' ---------------------'), nl,
    write(' | '), show2(L,s(1,2)),
    write(' | '), show2(L,s(2,2)),
    write(' | '), show2(L,s(3,2)),
    write(' | '), show2(L,s(4,2)),
    write(' | '), show2(L,s(5,2)), write(' | '),nl,
write(' ---------------------'), nl,
    write(' | '), show2(L,s(1,3)),
    write(' | '), show2(L,s(2,3)),
    write(' | '), show2(L,s(3,3)),
    write(' | '), show2(L,s(4,3)),
    write(' | '), show2(L,s(5,3)),write(' | '), nl,
write(' ---------------------'), nl,
    write(' | '), show2(L,s(1,4)),
    write(' | '), show2(L,s(2,4)),
    write(' | '), show2(L,s(3,4)),
    write(' | '), show2(L,s(4,4)),
    write(' | '), show2(L,s(5,4)),write(' | '), nl,
write(' ---------------------'), nl,
    write(' | '), show2(L,s(1,5)),
    write(' | '), show2(L,s(2,5)),
    write(' | '), show2(L,s(3,5)),
    write(' | '), show2(L,s(4,5)),
    write(' | '), show2(L,s(5,5)),write(' | '), nl,
write(' ---------------------'), nl,
    write(' | '), show2(L,s(1,6)),
    write(' | '), show2(L,s(2,6)),
    write(' | '), show2(L,s(3,6)),
    write(' | '), show2(L,s(4,6)),
    write(' | '), show2(L,s(5,6)),write(' | '), nl,
write(' ---------------------'), nl,
    write(' | '), show2(L,s(1,7)),
    write(' | '), show2(L,s(2,7)),
    write(' | '), show2(L,s(3,7)),
    write(' | '), show2(L,s(4,7)),
    write(' | '), show2(L,s(5,7)),write(' | '), nl,
write(' ---------------------'), nl,
    write(' | '), show2(L,s(1,8)),
    write(' | '), show2(L,s(2,8)),
    write(' | '), show2(L,s(3,8)),
    write(' | '), show2(L,s(4,8)),
    write(' | '), show2(L,s(5,8)),write(' | '), nl,
write(' ---------------------'), nl,
    write(' | '), show2(L,s(1,9)),
    write(' | '), show2(L,s(2,9)),
    write(' | '), show2(L,s(3,9)),
    write(' | '), show2(L,s(4,9)),
    write(' | '), show2(L,s(5,9)),write(' | '), nl,
write(' ---------------------'), nl.


    
show2(_,s(X,Y)) :-
    barrier(X,Y),
    write('x').
    
show2(L,s(X,Y)) :-
    member(s(X,Y),L),
    write('o').

show2(_,s(X,Y)) :-
    X == 1,Y == 9,
    write('G').
    
show2(_,_) :-
    write(' ').

%   start(s(5,1)).