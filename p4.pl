and(A,B):- is_true(A), is_true(B).
or(A,B):- is_true(A) ; is_true(B).
is_true(true).
is_true(A):- var(A), !, false.
is_true(and(A,B)):- and(A,B).
is_true(or(A,B)):- or(A,B).
is_true(not(A)):-not(A).

isAssignment([],[]).
isAssignment([_|Tail],[true|Ass]):-isAssignment(Tail,Ass).
isAssignment([_|Tail],[false|Ass]):-isAssignment(Tail,Ass).

istrue(E,L):-term_variables(E,Ls),L = Ls,E.
varsOf(E,V):-term_variables(E,V).
isNotTaut(E):-varsOf(E,V),isAssignment(V,Ass),not(istrue(E,Ass)),!.
isTaut(E):-not(isNotTaut(E)).

/*
?- isTaut(or(X,not(X))).
true.
?- isTaut(and(X,not(X))).
false.
*/
