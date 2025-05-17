cat(butsi).
cat(korni).
cat(mactevity).

dog(flash).
dog(rover).
dog(spot).

color(butsi, brown).
color(korni, black).
color(mactevity, ginger).
color(flash, spotted).
color(rover, ginger).
color(spot, white).

owner(tom, Animal) :-
    color(Animal, black);
    color(Animal, brown).

owner(kate, Animal) :-
    dog(Animal),
    color(Animal, Color),
    Color \= white,
    \+ owner(tom, Animal).

has_pedigree(Animal) :-
    owner(tom, Animal);
    owner(kate, Animal).

owner(alan, mactevity) :-
    \+ owner(kate, butsi),
    \+ has_pedigree(spot).

animal(X) :- cat(X).
animal(X) :- dog(X).

all_dogs_with_color(Dog, Color) :-
    dog(Dog),
    color(Dog, Color).

tom_animals(Animal) :-
    owner(tom, Animal).

kate_dogs(Dog) :-
    dog(Dog),
    owner(kate, Dog).

no_owner(Animal) :-
    animal(Animal),
    \+ owner(tom, Animal),
    \+ owner(kate, Animal),
    \+ owner(alan, Animal).
