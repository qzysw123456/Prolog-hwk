perm([],[]).
perm([A|B],C):- length([A|B],L),length(C,L), select(A,C,D),perm(B,D).

/*
?- perm([1,2,3],[3,2,1]).
true

?- perm([1,2,3,4],[4,2,3]).
false.
*/
