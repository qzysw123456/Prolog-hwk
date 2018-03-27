isinsert(Y,A,X) :- append(List0,List2,X),append(List0,[A],List1),append(List1,List2,Y).
/*
?- isinsert([1,2,3,4,5,6,7],3,[1,2,4,5,6,7]).
true
*/
