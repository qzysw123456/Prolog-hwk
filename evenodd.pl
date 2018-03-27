even(N) :- 0 is N mod 2.
evenlist(X):- length(X,L), even(L).

/*
?- evenlist([1,2,3,4,5]).
false.

?- evenlist([1,2,3,4,5,6]).
true.
*/
