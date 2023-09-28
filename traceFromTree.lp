%
% based on https://whyjava.files.wordpress.com/2019/04/distributed-tracing.jpg
%

span(a, none, t).
relation(a, b, di).
relation(a, e, di).
    span(b, a, t).
    relation(c, b, s).
    relation(d, b, f).
        span(c, b, t).
        span(d, b, t).
        %nem derülhet ki ezekből az adatokból hogy C meets D
span(e, a, t).

%csak ebből:
% a |---
% b | -
% c | -
% d | -
% e | -
% 
% dl(sp(a),0) dl(ep(a),3)
% dl(sp(b),1) dl(ep(b),2)
% dl(sp(c),1) dl(ep(c),2) 
% dl(sp(d),1) dl(ep(d),2) 
% dl(sp(e),1) dl(ep(e),2)

%hozzáadott információk:
% Step 1:
% relation(b,e,m).
% result:
% a |----
% b | -
% c | -
% d | -
% e |  -
%
% dl(sp(a),0) dl(ep(a),4)
% dl(sp(b),1) dl(ep(b),2)
% dl(sp(c),1) dl(ep(c),2)
% dl(sp(d),1) dl(ep(d),2)   
% dl(sp(e),2) dl(ep(e),3) 


% Step 2:
% relation(b,e,m). relation(c,d,m).
% result:
% a |-----
% b | --
% c | -
% d |  -
% e |   -
% Matches
%
% dl(sp(a),0) dl(ep(a),5)
% dl(sp(b),1) dl(ep(b),3)
% dl(sp(c),1) dl(ep(c),2)
% dl(sp(d),2) dl(ep(d),3)
% dl(sp(e),3) dl(ep(e),4)



relates(a,d).
relates(d,e).
relation(b,e,m).
relation(c,d,m).

