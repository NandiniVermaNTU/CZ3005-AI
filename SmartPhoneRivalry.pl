/* relations */

company(sumsum).
company(appy).
competitors(sumsum, appy).
developed(sumsum, galactica-s3).
smartphonetechnology(galactica-s3).
steal(stevey, galactica-s3).
boss(stevey, appy).

/* rules */

rival(X, Y):-
	competitors(X, Y).

business(X):-
	smartphonetechnology(X).

unethical(X):-
	boss(X, A), company(A), steal(X, B), business(B), developed(Y, B), company(Y), rival(Y, A).


