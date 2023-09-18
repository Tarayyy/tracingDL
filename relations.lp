%-------------------------------------------------------------
% Allen's interval algebra relations
% Based on: https://cse.unl.edu/~choueiry/Documents/Allen-CACM1983.pdf
%-------------------------------------------------------------

% equals
% X equals Y
& diff { sp (X) -sp (Y) } <= 0 :- relation (X ,Y , eq ).
& diff { sp (Y) -sp (X) } <= 0 :- relation (X ,Y , eq ).
& diff { ep (X) -ep (Y) } <= 0 :- relation (X ,Y , eq ).
& diff { ep (Y) -ep (X) } <= 0 :- relation (X ,Y , eq ).

% during
% X is during Y
& diff { sp (Y) -sp (X) } <= -1 :- relation (X ,Y ,d).
& diff { ep (X) -ep (Y) } <= -1 :- relation (X ,Y ,d).
%todo: ((t- > s-) & (t+ =(s+)) or
%      ((t- >= s-) & (t+ < s+))
% From Allen CACM1983 pdf
% Y contains X
relation(X,Y,d) :- relation(Y,X,di).

%precedes
% X precedes Y
& diff { ep(X) - sp(Y) } <= -1 :- relation(X,Y,p).
% X is preceded by Y
relation(X,Y,p) :- relation(Y,X,pi).

%meets
% X meets Y
& diff { ep(X) - sp(Y) } <= 0 :- relation(X,Y,m).
& diff { sp(Y) - ep(X) } <= 0 :- relation(X,Y,m).
% X is met by Y
relation(X,Y,m) :- relation(Y,X,mi).

%overlaps
% X overlaps Y x4 - x2
& diff { sp(Y) - ep(X) } <= -1 :- relation(X,Y,o).
& diff { sp(X) - sp(Y) } <= -1 :- relation(X,Y,o).
& diff { ep(X) - ep(Y) } <= -1 :- relation(X,Y,o).
% X is overlapped by Y
relation(X,Y,o) :- relation(Y,X,oi).

%starts
% X starts Y
& diff { sp(X) - sp(Y) } = 0 :- relation(X,Y,s).
& diff { ep(X) - ep(Y) } <= 0 :- relation(X,Y,s).
% X is started by Y
relation(X,Y,s) :- relation(Y,X,si).

%finishes
% X finishes Y
&diff { ep(X) - ep(Y) } = 0 :- relation(X,Y,f).
&diff { sp(Y) - sp(X) } <= 0 :- relation(X,Y,f).
% X is finished by Y
relation(X,Y,f) :- relation(Y,X,fi).