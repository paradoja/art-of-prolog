% (i)
% sister

sister(Sister, Sib) :- parent(Parent, Sister),
                       parent(Parent, Sib),
                       female(Sister),
                       Sister \= Sib.

% niece

niece(Niece, Uncle) :- uncle(Uncle, Niece),
                       female(Niece).
niece(Niece, Uncle) :- brother(Uncle, Parent),
                       parent(Parent, Niece),
                       female(Niece).

% sibling

sibling(Sib1, Sib2) :- father(Father, Sib1),
                       father(Father, Sib2),
                       mother(Mother, Sib1),
                       mother(Mother, Sib2),
                       Sib1 \= Sib2.

% (ii)

mother_in_law(Mother, Person) :- mother(Mother, Wife),
                                 married_couple(Wife, Person).

brother_in_law(Brother, Person) :- brother(Brother, Wife),
                                   married_couple(Wife, Person).

son_in_law(Son, Person) :- mother_in_law(Person, Son).


% (iii)

left_of2(bike, photo_camera).

left_of2(pencil, sandclock).
left_of2(sandclock, butterfly).
left_of2(butterfly, fish).

% http://stackoverflow.com/questions/16325238/left-of-exercise-from-the-art-of-prolog
% left_of(X, Y) :- left_of(X, Z), left_of(Z, Y).
left_of(X, Y) :- left_of2(X, Y).
left_of(X, Y) :- left_of2(X, Z), left_of(Z, Y).

above(bike, pencil).
above(bike, Y) :- left_of(pencil, Y).
above(photo_camera, X) :- above(bike, X).

right_of(X, Y) :- left_of(Y, X).

bellow(X, Y) :- above(Y, X).
