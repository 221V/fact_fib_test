-module(e1).
-compile([export_all, nowarn_export_all]).


% factorial
e12(0) -> 1;
e12(N) ->
  N * e12(N-1).


e22(N) -> e22(N,1).
e22(0,A) -> A;
e22(N,A) when N > 0 -> e22(N-1, N*A).


% fibonacci
e32(0) -> 0;
e32(1) -> 1;
e32(N) ->
  e32(N-1) + e32(N-2).


e42(N) when N > 0 -> e42(N, 0, 1).
e42(0, F1, _F2) -> F1;
e42(N, F1, F2) -> e42(N-1, F2, F1+F2).


% testing
test1(N) ->
  T0 = erlang:system_time(millisecond),
  Z1 = e12(N),
  io:format("~p~n", [ Z1 ]),
  T1 = erlang:system_time(millisecond),
  T2 = T1 - T0,
  io:format("Milliseconds: ~p~n", [ T2 ]),
  ok.


test2(N) ->
  T0 = erlang:system_time(millisecond),
  Z1 = e22(N),
  io:format("~p~n", [ Z1 ]),
  T1 = erlang:system_time(millisecond),
  T2 = T1 - T0,
  io:format("Milliseconds: ~p~n", [ T2 ]),
  ok.



test3(N) ->
  T0 = erlang:system_time(millisecond),
  Z1 = e32(N),
  io:format("~p~n", [ Z1 ]),
  T1 = erlang:system_time(millisecond),
  T2 = T1 - T0,
  io:format("Milliseconds: ~p~n", [ T2 ]),
  ok.


test4(N) ->
  T0 = erlang:system_time(millisecond),
  Z1 = e42(N),
  io:format("~p~n", [ Z1 ]),
  T1 = erlang:system_time(millisecond),
  T2 = T1 - T0,
  io:format("Milliseconds: ~p~n", [ T2 ]),
  ok.


