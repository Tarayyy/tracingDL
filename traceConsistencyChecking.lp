%
% based on https://whyjava.files.wordpress.com/2019/04/distributed-tracing.jpg
%

%trace(a).
%trace_ref(a).

span(a, none, t, 0, 5).
    span(b, a, t, 1, 3).
        span(c, b, t, 1, 2).
        span(d, b, t, 2, 3).
    span(e, a, t, 3, 4).

relation_shall_be(a,b,d).
relation_shall_not_be(c,b,s).

relates(A,B) :- relation_shall_be(A,B,REF).
error(A,B,REF,REL) :- relation_shall_be(A,B,REF), relation(A,B,REL), REF != REL.

relates(A,B) :- relation_shall_not_be(A,B,REF).
error(A,B,REF,REL) :- relation_shall_not_be(A,B,REF), relation(A,B,REL), REF = REL.