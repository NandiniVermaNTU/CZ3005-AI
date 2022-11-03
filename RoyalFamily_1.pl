/* relations */

queen(queen_elizabeth).
female(queen_elizabeth).
female(princess_ann).

male(prince_charles).
male(prince_andrew).
male(prince_edward).

offspring(prince_charles, queen_elizabeth).
offspring(princess_ann, queen_elizabeth).
offspring(prince_andrew, queen_elizabeth).
offspring(prince_edward, queen_elizabeth).

elder(prince_charles, princess_ann).
elder(princess_ann, prince_andrew).
elder(prince_andrew, prince_edward).


/* rules */

is_elder(A,B):-
    older_than(A,B).
is_elder(A,B):-
    elder(A,X), is_elder(X,B).


/*Rule 1: Male child will always come before female child */
successor(X,Y):-
    offspring(X,A), offspring(Y,A), /*both offsprings having same parent */
    male(X), female(Y),
    not(queen(Y)).

/*Rule 2: Older male child will come before younger male child*/
successor(X,Y):-
    offspring(X,A), offspring(Y,A), /*both offsprings having the same parent*/
    male(X), male(Y),
    is_elder(X,Y).

/*Rule 3: Older female child will come before younger female child */
successor(X,Y):-
    offspring(X,A), offspring(Y,A), /*both offsprings having the same parent*/
    female(X), female(Y),
    is_elder(X,Y),
	not(queen(X)), not(queen(Y)).


                           

