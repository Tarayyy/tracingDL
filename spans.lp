&diff {sp(SPAN)-ep(SPAN)} <= -1 :- span(SPAN,PARENT,TRACE).

&diff {sp(SPAN)-ep(SPAN)} <= -1 :- span(SPAN,PARENT,TRACE,SP,EP).
&diff {SP - sp(SPAN)} = 0 :- span(SPAN,PARENT,TRACE,SP,EP).
&diff {EP - ep(SPAN)} = 0 :- span(SPAN,PARENT,TRACE,SP,EP).

1{relation(A, B, eq);relation(A, B, d);relation(A, B, p);relation(A, B, m);relation(A, B, o);relation(A, B, s);relation(A, B, f);
relation(A, B, di);relation(A, B, pi);relation(A, B, mi);relation(A, B, oi);relation(A, B, si);relation(A, B, fi)}1 :- relates(A,B).