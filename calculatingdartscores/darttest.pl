[kattio].

main :-
    repeat,
    read_int(X),
    findDartScore(X).

% Lista med alla värden 1-20 för single, doouble och triple 
tupList([(60, "triple 20"), (57, "triple 19"),
        (54, "triple 18"), (51, "triple 17"), (48, "triple 16"),
        (45, "triple 15"), (42, "triple 14"), (40, "double 20"), (39, "triple 13"), 
        (38, "double 19"), (36, "double 18"), (34, "double 17"), (33, "triple 11"),
        (32, "double 16"), (30, "double 15"), (28, "double 14"), (27, "triple 9"),
        (26, "double 13"), (24, "double 12"), (22, "double 11"),
        (21, "triple 7"),
        (20, "single 20"), (19, "single 19"), (18, "single 18"),
        (17, "single 17"), (16, "single 16"), (15, "single 15"), (14, "single 14"),
        (13, "single 13"), (12, "single 12"), (11, "single 11"), (10, "single 10"),
        (9, "single 9"), (8, "single 8"), (7, "single 7"), (6, "single 6"),
        (5, "single 5"), (4, "single 4"), (3, "single 3"), (2, "single 2"),
        (1, "single 1")]).



% Specialfall som skulle misstas som impossible annars
findDartScore(X) :-
    X == 143,
    show_records(["triple 20", "triple 19", "double 13"]),
    nl.

findDartScore(X) :-
    X == 145,
    show_records(["triple 20", "triple 19", "double 14"]),
    nl.

findDartScore(X) :-
    X == 149,
    show_records(["triple 20", "triple 19", "double 16"]),
    nl.

findDartScore(X) :-
    X == 151,
    show_records(["triple 20", "triple 19", "double 17"]),
    nl.

findDartScore(X) :-
    X == 155,
   show_records(["triple 20", "triple 19", "double 19"]),
    nl.

findDartScore(X) :-
    X == 157,
    show_records(["triple 20", "triple 19", "double 20"]),
    nl.

% Försök hitta rätt kombo för target score X
findDartScore(X) :-
    findCombo(X, 0, []).


findCombo(X, _, List) :- %Basfall (Om vi har hittat en kombo)
    X == 0, !,
    show_records(List).

findCombo(X, N, _) :- %Basfall (Det gick inte att hitta en kombo)
    X \== 0,
    N == 3,
    write("impossible"),
    nl.

%Rekusiva fallet
findCombo(X, N, List) :-
    tupList(L),
    getTup(X, L), % hitta värde i getTup listan
    nb_getval(y, Y), % hämta värdet som vi hittade 
    X1 is (X - Y), % subtrahera det hittade värdet från target score X
    N1 is (N+1), % Håll koll på antal kast
    nb_getval(y2, Y2), % shämta stängen för kastet
    appendEl(Y2, List, Z), % lägg till strängen i listan med stängar
    findCombo(X1, N1, Z).  % fortsätt rekursionen

% Helper
getTup(X, [(H,T)|_]) :-  %Basfall, Om vi hittat ett tal i tupList som är =< än target score X 
  H =< X,
  %Y is H,
  nb_setval(y, H), % spara värdet i globala variabeln y
  nb_setval(y2, T). % spara strängen i globala variabeln y2
  %Y2 = T, !.
  %print(Y),
  %print(Y2).

getTup(X, [(H,_)|T]) :- %Otherwise, dvs gå igenom tupList och hitta ett mindre värde än X target score
  H > X,
  getTup(X, T).


show_records([]). % Skriv ut resultatet
show_records([A|B]) :-
    write(A),
    nl,
    show_records(B).

appendEl(X, [], [X]).
appendEl(X, [H | T], [H | Y]) :-
           appendEl(X, T, Y).
