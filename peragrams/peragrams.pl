[kattio].

%Samma metodik som för peragrams.hs fast lite extra steg med att göra samma saker

main :-
    repeat,
    read_string(X),
    (X == end_of_file ;
     peragrams(X),
     fail
    ).



count(_,[],0).
%Funktion som räknar antalet gånger bokstaven Element(ascii form) förekommer i texten
count(Element,[X|List],OccurNum) :-
    Element = X,!,
    count(Element,List,OccurNum1),
    OccurNum is OccurNum1 + 1.

count(Element,[_|List],OccurNum) :-
    count(Element,List,OccurNum).



%Samma som i haskell-versionen
helper(0,A) :-!, A is 0.
helper(T,A) :-
    evenNmr(T),!,
    A is T - 1.
helper(T,A) :- 
    oddNmr(T),!,
    A is T.

work(1,_,Ans) :-!, Ans is 0.

%length (filter odd X) - 1
work(LEN,X,Ans) :-
    oddNmr(LEN),!,
    exclude(evenNmr, X, Out),
    length(Out,Temp),
    Ans is Temp - 1.

%helper (length (filter odd X))
work(LEN,X,Ans) :-
    evenNmr(LEN),!,
    exclude(evenNmr,X,Out),
    length(Out,Temp),
    helper(Temp,Ans).

evenNmr(H) :-
    A is (H mod 2),
    A = 0.

oddNmr(H) :-
    A is (H mod 2),
    A = 1.


peragrams(X) :-

    count(97, X, A),
    count(98, X, B),
    count(99, X, C),
    count(100, X, D),
    count(101, X, E),
    count(102, X, F),
    count(103, X, G),
    count(104, X, H),
    count(105, X, I),
    count(106, X, J),
    count(107, X, K),
    count(108, X, L),
    count(109, X, M),
    count(110, X, N),
    count(111, X, O),
    count(112, X, P),
    count(113, X, Q),
    count(114, X, R),
    count(115, X, S),
    count(116, X, T),
    count(117, X, U),
    count(118, X, V),
    count(119, X, W),
    count(120, X, X2),
    count(121, X, Y),
    count(122, X, Z),
    
    Length is (A + B + C + D + E + F + G + H + I + J + K + L + M + N + O + P + Q + R + S + T + U + V + W + X2 + Y + Z),


    work(Length,[A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X2,Y,Z], Ans),

    write(Ans).
