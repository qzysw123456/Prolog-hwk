gensubset([],[]).
gensubset([H|T],[H|T2]):-gensubset(T,T2).
gensubset([_|T],L2):-gensubset(T,L2).

graph(Nodelist,Listadj).
adj(Node,Connection).

get_Nodelist(graph(X,_),X).
get_Listadj(graph(_,X),X).
get_Adjnode(adj(X,_),X).
get_Adjconnection(adj(_,X),X).

pair(A,B,C):-member(A,C),member(B,C),A>B.
has(A,B,[adj(A,Edge)|_]):- member(B,Edge).
has(A,B,[adj(_,_)|Tail]):- has(A,B,Tail).

notclique(Clique,Adjlist):- member(A,Clique),member(B,Clique),A>B,not(has(A,B,Adjlist)),!.
isclique(Clique,Adjlist):-not(notclique(Clique,Adjlist)).
clique(G,K,Clique):-get_Nodelist(G,GG),gensubset(GG,Clique),length(Clique,K),get_Listadj(G,Adj),isclique(Clique,Adj).


/*
?- G1 = graph([1, 2, 3, 4], [adj(1, [2, 3]), adj(2, [1, 3, 4]), adj(3, [1, 2, 4]), adj(4, [2, 3])]),clique(G1,K,Clique).
G1 = graph([1, 2, 3, 4], [adj(1, [2, 3]), adj(2, [1, 3, 4]), adj(3, [1, 2, 4]), adj(4, [2, 3])]),
K = 3,
Clique = [1, 2, 3]
G1 = graph([1, 2, 3, 4], [adj(1, [2, 3]), adj(2, [1, 3, 4]), adj(3, [1, 2, 4]), adj(4, [2, 3])]),
K = 2,
Clique = [1, 2]
G1 = graph([1, 2, 3, 4], [adj(1, [2, 3]), adj(2, [1, 3, 4]), adj(3, [1, 2, 4]), adj(4, [2, 3])]),
K = 2,
Clique = [1, 3]
G1 = graph([1, 2, 3, 4], [adj(1, [2, 3]), adj(2, [1, 3, 4]), adj(3, [1, 2, 4]), adj(4, [2, 3])]),
K = 1,
Clique = [1]
G1 = graph([1, 2, 3, 4], [adj(1, [2, 3]), adj(2, [1, 3, 4]), adj(3, [1, 2, 4]), adj(4, [2, 3])]),
K = 3,
Clique = [2, 3, 4]
G1 = graph([1, 2, 3, 4], [adj(1, [2, 3]), adj(2, [1, 3, 4]), adj(3, [1, 2, 4]), adj(4, [2, 3])]),
K = 2,
Clique = [2, 3]
G1 = graph([1, 2, 3, 4], [adj(1, [2, 3]), adj(2, [1, 3, 4]), adj(3, [1, 2, 4]), adj(4, [2, 3])]),
K = 2,
Clique = [2, 4]
G1 = graph([1, 2, 3, 4], [adj(1, [2, 3]), adj(2, [1, 3, 4]), adj(3, [1, 2, 4]), adj(4, [2, 3])]),
K = 1,
Clique = [2]
G1 = graph([1, 2, 3, 4], [adj(1, [2, 3]), adj(2, [1, 3, 4]), adj(3, [1, 2, 4]), adj(4, [2, 3])]),
K = 2,
Clique = [3, 4]
G1 = graph([1, 2, 3, 4], [adj(1, [2, 3]), adj(2, [1, 3, 4]), adj(3, [1, 2, 4]), adj(4, [2, 3])]),
K = 1,
Clique = [3]
G1 = graph([1, 2, 3, 4], [adj(1, [2, 3]), adj(2, [1, 3, 4]), adj(3, [1, 2, 4]), adj(4, [2, 3])]),
K = 1,
Clique = [4]
G1 = graph([1, 2, 3, 4], [adj(1, [2, 3]), adj(2, [1, 3, 4]), adj(3, [1, 2, 4]), adj(4, [2, 3])]),
K = 0,
Clique = [].
*/
