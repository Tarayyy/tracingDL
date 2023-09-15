#show.

%#show dl/2.

span(x1).
span(x2).
span(x3).
span(x4).
&diff {sp(A)-ep(A)} <= -1 :- span(A).

%dl(sp(x1),1).
%-------------------------------------------------------------

%x1->x4
1{chosen(x1 ,x4, d);chosen(x1 ,x4, s);chosen(x4 ,x1, f)}1.

%x1->x2
1{chosen(x1,x2,p);chosen(x1,x2,m)}1.

%B
1{chosen(x1, x3, eq);chosen(x1, x3, d);chosen(x1, x3, p);chosen(x1, x3, m);chosen(x1, x3, o);chosen(x1, x3, s);chosen(x1, x3, f);
chosen(x1, x3, di);chosen(x1, x3, pi);chosen(x1, x3, mi);chosen(x1, x3, oi);chosen(x1, x3, si);chosen(x1, x3, fi)}1.

%x2->x4
1{chosen(x4 ,x2, o);chosen(x2,x4,m)}1.

%x2->x3
1{chosen(x3 ,x2, o)}1.

%x3->x4
1{chosen(x4 ,x3, p);chosen(x3 ,x4, eq)}.
%chosen(x3 ,x4, eq).

%TODO: kész intervallumokból meghatározni

%-------------------------------------------------------------

% equals
% X equals Y
& diff { sp (X) -sp (Y) } <= 0 :- chosen (X ,Y , eq ).
& diff { sp (Y) -sp (X) } <= 0 :- chosen (X ,Y , eq ).
& diff { ep (X) -ep (Y) } <= 0 :- chosen (X ,Y , eq ).
& diff { ep (Y) -ep (X) } <= 0 :- chosen (X ,Y , eq ).

% during
% X is during Y
& diff { sp (Y) -sp (X) } <= -1 :- chosen (X ,Y ,d).
& diff { ep (X) -ep (Y) } <= -1 :- chosen (X ,Y ,d).
% Y contains X
chosen(X,Y,d) :- chosen(Y,X,di).

%precedes
% X precedes Y
& diff { ep(X) - sp(Y) } <= -1 :- chosen(X,Y,p).
% X is preceded by Y
chosen(X,Y,p) :- chosen(Y,X,pi).

%meets
% X meets Y
& diff { ep(X) - sp(Y) } <= 0 :- chosen(X,Y,m).
& diff { sp(Y) - ep(X) } <= 0 :- chosen(X,Y,m).
% X is met by Y
chosen(X,Y,m) :- chosen(Y,X,mi).

%overlaps
% X overlaps Y x4 - x2
& diff { sp(Y) - ep(X) } <= -1 :- chosen(X,Y,o).
& diff { sp(X) - sp(Y) } <= -1 :- chosen(X,Y,o).
% X is overlapped by Y
chosen(X,Y,o) :- chosen(Y,X,oi).

%starts
% X starts Y
& diff { sp(X) - sp(Y) } <= 0 :- chosen(X,Y,s).
& diff { sp(Y) - sp(X) } <= 0 :- chosen(X,Y,s).
& diff { ep(X) - ep(Y) } <= 0 :- chosen(X,Y,s).
% X is started by Y
chosen(X,Y,s) :- chosen(Y,X,si).

%finishes
% X finishes Y
&diff { ep(X) - ep(Y) } <= 0 :- chosen(X,Y,f).
&diff { ep(Y) - ep(X) } <= 0 :- chosen(X,Y,f).
&diff { sp(X) - sp(Y) } <= 0 :- chosen(X,Y,f).
% X is finished by Y
chosen(X,Y,f) :- chosen(Y,X,fi).