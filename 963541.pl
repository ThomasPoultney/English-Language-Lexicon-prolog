:- use_rendering(svgtree, [list(false)]).

s(s(NP,VP)) --> np(Num,NP), vp(Num,VP).
s(s(NP,VP)) --> np(Num,GP,subject,NP), vp(Num,GP,VP).

np(Num,np(Det,Nbar)) --> det(Num,Det),nbar(Num,Nbar).
np(Num,np(Det,Nbar,PP)) --> det(Num,Det),nbar(Num,Nbar),pp(PP).
np(Num,_,np(Det,Nbar)) --> det(Num,Det),nbar(Num,Nbar).
np(Num,_,np(Det,Nbar,PP)) --> det(Num,Det),nbar(Num,Nbar),pp(PP).
np(Num,GP,Subject,np(Pro)) --> pro(Num,GP,Subject,Pro).

vp(plural,vp(V,Np)) --> v(plural,_,V),np(_,Np).
vp(singular,vp(V,Np)) --> v(singular,3,V),np(_,Np).
vp(plural,vp(V,Np)) --> v(plural,_,V),np(_,_,object,Np).
vp(singular,vp(V,Np)) --> v(singular,3,V),np(_,_,object,Np).
vp(Num,GP,vp(V,Np)) --> v(Num,GP,V),np(_,_,object,Np).
vp(Num,GP,vp(V,Np)) --> v(Num,GP,V),np(_,_,Np).

nbar(Num,nbar(N)) --> n(Num,N).
nbar(Num,nbar(Jp)) --> jp(Num,Jp).

jp(Num,jp(Adj,Jp)) --> adj(Adj), jp(Num,Jp).
jp(Num,jp(Adj,N)) --> adj(Adj), n(Num,N).

pp(pp(Prep,Np)) --> prep(Prep),np(_,_,Np).

prep(prep(Word)) --> [Word], {lex(Word,prep)}.

adj(adj(Word)) --> [Word], {lex(Word,adj)}.

det(SG,det(Word)) --> [Word], {lex(Word,det,SG)}.
n(SG,n(Word)) --> [Word], {lex(Word,n,SG)}.

v(SG,Person,v(Word)) --> [Word], {lex(Word,v,SG,Person)}.

pro(SG,Person,Subject,pro(Word)) --> [Word], {lex(Word,pro,SG,Person,Subject)}.


lex(on,prep).
lex(in,prep).
lex(under,prep).

lex(old,adj).
lex(young,adj).
lex(red,adj).
lex(short,adj).
lex(tall,adj).

lex(the,det,_).
lex(a,det,singular).
lex(two,det,plural).

lex(man,n,singular).
lex(woman,n,singular).
lex(apple,n,singular).
lex(chair,n,singular).
lex(room,n,singular).
lex(men,n,plural).
lex(women,n,plural).
lex(apples,n,plural).
lex(chairs,n,plural).
lex(rooms,n,plural).

lex(know,v,singular,1).
lex(know,v,singular,2).
lex(knows,v,singular,3).
lex(know,v,plural,_).
lex(see,v,singular,1).
lex(see,v,singular,2).
lex(sees,v,singular,3).
lex(see,v,plural,_).

lex(i,pro,singular,1,subject).
lex(you,pro,singular,2,subject).
lex(he,pro,singular,3,subject).
lex(she,pro,singular,3,subject).
lex(it,pro,singular,3,subject).
lex(we,pro,plural,1,subject).
lex(you,pro,plural,2,subject).
lex(they,pro,plural,3,subject).

lex(me,pro,singular,1,object).
lex(you,pro,singular,2,object).
lex(him,pro,singular,3,object).
lex(her,pro,singular,3,object).
lex(it,pro,singular,3,object).
lex(us,pro,plural,1,object).
lex(you,pro,plural,2,object).
lex(them,pro,plural,3,object).


%--------------------------------%
%	test results 18/18 passed    %
%--------------------------------%
%test 1 - true - correct
%s(Tree, [the, woman, sees, the, apples], []).
%test 2 - true - correct
% s(Tree, [a, woman, knows, him],[]).
%test 3 - false - correct
%s(Tree, [two, woman, sees, a, man],[]).
%test 4 - true - correct
% s(Tree, [two, women, see, a, man],[]).
% test 5 - false - correct
% s(Tree, [the, man, see, the, apples],[]).
%test 6 -true - correct
%s(Tree, [the, men, see, the, apples],[]).
%test 7 - false - correct
% s(Tree, [the, men, sees, the, apples],[]).
%test 8 - true - correct
%s(Tree, [she, knows, the, man],[]).
%test 9 - false - correct
% s(Tree, [she, know, the, man],[]).
%test 10 - false - correct
%s(Tree, [us, sees, the, apple],[]).
%test 11 - true - correct
% s(Tree, [i, know, a, short, man],[]).
%test 12 - false - correct
%s(Tree, [the, tall, woman, sees, the, red],[]).
%test 13 - true - correct
%s(Tree, [the, young, tall, man, knows, the, old, short, woman],[]).
%test 14 - false - correct
% s(Tree, [a, man, tall, knows, the, short, woman],[]).
%test 15 - true - correct
% s(Tree, [a, man, on, a, chair, sees, a, woman, in, a, room],[]).
%test 16 - false - correct
% s(Tree, [a, man, on, a, chair, sees, a, woman, a, room, in],[]).
%test 17 - true - correct
%s(Tree, [the, tall, young, woman, in, a, room, sees, the, red, apples, under, the, chair],[]).
%test 18 - true - correct
%s(Tree, [the, woman, in, a, room, on, the, chair, in, a, room, in, the, room, sees, the, man],[]).

%code before parse tree implemented more understandable%
/*

s --> np(Num),vp(Num).
s --> np(Num,GP,subject), vp(Num,GP).

np(Num) --> det(Num),nbar(Num).
np(Num) --> det(Num),nbar(Num),pp.
np(Num,_) --> det(Num),nbar(Num).
np(Num,_) --> det(Num),nbar(Num),pp.
np(Num,GP,Subject) --> pro(Num,GP,Subject).

vp(plural) --> v(plural,_),np(_).
vp(singular) --> v(singular,3),np(_).
vp(plural) --> v(plural,_),np(_,_,object).
vp(singular) --> v(singular,3),np(_,_,object).
vp(Num,GP) --> v(Num,GP),np(_,_,object).
vp(Num,GP) --> v(Num,GP),np(_,_).

nbar(Num) --> n(Num).
nbar(Num) --> jp(Num).


jp(Num) --> adj, jp(Num).
jp(Num) --> adj, n(Num).

pp --> prep,np(_,_).

prep --> [Word], {lex(Word,prep)}.
adj --> [Word], {lex(Word,adj)}.

det(SG) --> [Word], {lex(Word,det,SG)}.
n(SG) --> [Word], {lex(Word,n,SG)}.

v(SG,Person) --> [Word], {lex(Word,v,SG,Person)}.

pro(SG,Person,Subject) --> [Word], {lex(Word,pro,SG,Person,Subject)}.

lex(on,prep).
lex(in,prep).
lex(under,prep).

lex(old,adj).
lex(young,adj).
lex(red,adj).
lex(short,adj).
lex(tall,adj).

lex(the,det,_).
lex(a,det,singular).
lex(two,det,plural).

lex(man,n,singular).
lex(woman,n,singular).
lex(apple,n,singular).
lex(chair,n,singular).
lex(room,n,singular).
lex(men,n,plural).
lex(women,n,plural).
lex(apples,n,plural).
lex(chairs,n,plural).
lex(rooms,n,plural).

lex(know,v,singular,1).
lex(know,v,singular,2).
lex(knows,v,singular,3).
lex(know,v,plural,_).
lex(see,v,singular,1).
lex(see,v,singular,2).
lex(sees,v,singular,3).
lex(see,v,plural,_).

lex(i,pro,singular,1,subject).
lex(you,pro,singular,2,subject).
lex(he,pro,singular,3,subject).
lex(she,pro,singular,3,subject).
lex(it,pro,singular,3,subject).
lex(we,pro,plural,1,subject).
lex(you,pro,plural,2,subject).
lex(they,pro,plural,3,subject).

lex(me,pro,singular,1,object).
lex(you,pro,singular,2,object).
lex(him,pro,singular,3,object).
lex(her,pro,singular,3,object).
lex(it,pro,singular,3,object).
lex(us,pro,plural,1,object).
lex(you,pro,plural,2,object).
lex(them,pro,plural,3,object).
*/
