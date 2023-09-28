%
% based on https://whyjava.files.wordpress.com/2019/04/distributed-tracing.jpg
%

span(a, none, t, 0, 5).
    span(b, a, t, 1, 3).
        span(c, b, t, 1, 2).
        % d missing
    span(e, a, t, 3, 4).

relation(d, b, f).
relation(c, d, m).