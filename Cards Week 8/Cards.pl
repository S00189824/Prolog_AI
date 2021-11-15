% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.

suites([spades,clubs,diamonds,hearts]).
faces([1,2,3,4,5,6,7,8,9,10,j,k,q]).

make_cardsV2(CardsList) :-
    setof(S,suit(S),SList),
    setof(F,face(F),FList),
    setof([SS,FF],(member(SS,SList),member(FF,FList)),CardsList).

make_cards(Cards) :-
    make_cards_list(CardsList),
    make_cards_faces(Cardslist,Cards).

write_list([]).
write_list([H|T]) :-
    write(H),n1,
    write_list(T).


make_cards(CardsList) :-
    setof([S,F],(faces(L1),
                member(F,L1),
                 suites(L2),
                 member(S,L2)), CardList).


make_card_faces([],[]).
make_card_faces([Element|T], [Card|OtherCards]) :-
    Card =.. Element,
    make_card_faces(T,OtherCards).

%This solution give a list of 4 lists
%one for each suite
%to get all in one deck
%change [FaceSuite|Rest] to FinalCardList
%and use

build_cards([],_,[]).
build_cards([Suite|OtherSuites],FaceList,[FaceList|Rest]) :-
    makesuite(suite,FaceList,FaceSuite),
    build_cards(otherSuites,FaceList,Rest).

make_suite(_,[],[]).
make_suite(S,[F|T],[Card|Rest]) :-
    Card =.. [S,F],
    makesuite(S,T,Rest).

