/* relations */
queen(queen_elizabeth).
female(queen_elizabeth).
female(princess_ann).

male(prince_charles).
male(prince_andrew).
male(prince_edward).

elder(prince_charles, princess_ann).
elder(prince_charles, prince_andrew).
elder(prince_charles, prince_edward).
elder(princess_ann, prince_andrew).
elder(princess_ann, prince_edward).
elder(prince_andrew, prince_edward).

offspring(prince_charles, queen_elizabeth).
offspring(princess_ann, queen_elizabeth).
offspring(prince_andrew, queen_elizabeth).
offspring(prince_edward, queen_elizabeth).


/* Rules */
/*Rule 1: Older child precedes younger child */
successor(X,Y):-
	offspring(X,A), offspring(Y,A), /*both offsprings having the same parent*/
    elder(X,Y),
	not(queen(X)), not(queen(Y)). /*must not be queen as queen precedes all offspring*/


/*Sorting*/
insert(X, [Y|Z], [Y|W]):- 
	not(successor(X,Y)), !, insert(X, Z, W).

insert(X, Z, [X|Z]).

lineOfSuccesion([X|Y], OrderedLine):- 
	lineOfSuccesion(Y, OrderedEnd),insert(X, OrderedEnd, OrderedLine).

lineOfSuccesion([], []).

finalSuccessionLine(X, SuccessionLine):-
	findall(Y, offspring(Y,X), Offspring), lineOfSuccesion(Offspring, SuccessionLine).