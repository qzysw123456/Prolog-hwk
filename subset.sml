datatype edge = Edge of int * int list;
datatype graph = Graph of int list * edge list;
val G = Graph([1,2,3,4],[Edge(1,[2,3]),Edge(2,[1,3,4]),Edge(3,[1,2,4]),Edge(4,[2,3])]);

fun member x [] = false
  | member x (hd::tl) = if(x=hd) then true else member x tl

fun check [] Adj = true
  | check (hd::tl) Adj = member hd Adj andalso check tl Adj

fun getAdj u (Edge(node,ls)::tl) = if(u=node) then ls else getAdj u tl

fun isclique [] Gra = true
  | isclique [_] Gra = true
  | isclique (h::tl) (Graph(U,E))= check tl (getAdj h E) andalso isclique tl (Graph(U,E))
  
exception Illegal_Clique

exception Clique_Impossible

fun present_clique clique =
        let fun present_clique_aux [] = (print "]")
	            | present_clique_aux (X::L) =
		            ((print ",") ;
                 (print (Int.toString X)) ;
                 (present_clique_aux L))
        in
           (print "[") ;
           if (clique = [])
           then (print "]\n")
           else let val clique = (rev clique) in
                  (print (Int.toString (hd clique)));
                  (present_clique_aux (tl clique))
                end ;
 	         if (TextIO.inputLine TextIO.stdIn) = SOME(";\n")
	         then ((print "\n") ; raise Clique_Impossible)
           else (print "\n")
        end


fun find_clique nodelist 0 ans graph= if(isclique ans graph)
                                      then (present_clique ans)
                                      else (raise Clique_Impossible)
  | find_clique [] n ans graph = raise Clique_Impossible
  | find_clique (m::ls') n ans graph =
        find_clique ls' (n-1) (m :: ans) graph
                handle Clique_Impossible => (find_clique ls' n ans graph)

fun max_clique (Graph(V,E))  n = (if n < 1 then raise Illegal_Clique
     		       else (find_clique V n [] (Graph(V,E))))
              	          handle Clique_Impossible =>
			           (print "No (more) solutions\n")
