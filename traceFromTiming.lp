%
% based on https://whyjava.files.wordpress.com/2019/04/distributed-tracing.jpg
%

span(a, none, t, 0, 5).
    span(b, a, t, 1, 3).
        span(c, b, t, 1, 2).
        span(d, b, t, 2, 3).
    span(e, a, t, 3, 4).

relates(a, b).
relates(a, c).
relates(a, d).
relates(a, e).

relates(b, c).
relates(b, d).
relates(b, e).