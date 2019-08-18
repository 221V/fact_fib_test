-module(e0).
-compile([export_all, nowarn_export_all]).


% factorial
e1(0) -> 1;
e1(N) ->
  N * e1(N-1).


e2(N) -> e2(N,1).
e2(0,A) -> A;
e2(N,A) when N > 0 -> e2(N-1, N*A).


% fibonacci
e3(0) -> 0;
e3(1) -> 1;
e3(N) ->
  e3(N-1) + e3(N-2).


e4(N) when N > 0 -> e4(N, 0, 1).
e4(0, F1, _F2) -> F1;
e4(N, F1, F2) -> e4(N-1, F2, F1+F2).


% testing
test1(N) ->
  T0 = erlang:system_time(millisecond),
  Z1 = e1(N),
  io:format("~p~n", [ Z1 ]),
  T1 = erlang:system_time(millisecond),
  T2 = T1 - T0,
  io:format("Milliseconds: ~p~n", [ T2 ]),
  ok.


test2(N) ->
  T0 = erlang:system_time(millisecond),
  Z1 = e2(N),
  io:format("~p~n", [ Z1 ]),
  T1 = erlang:system_time(millisecond),
  T2 = T1 - T0,
  io:format("Milliseconds: ~p~n", [ T2 ]),
  ok.


test3(N) ->
  T0 = erlang:system_time(millisecond),
  Z1 = e3(N),
  io:format("~p~n", [ Z1 ]),
  T1 = erlang:system_time(millisecond),
  T2 = T1 - T0,
  io:format("Milliseconds: ~p~n", [ T2 ]),
  ok.


test4(N) ->
  T0 = erlang:system_time(millisecond),
  Z1 = e4(N),
  io:format("~p~n", [ Z1 ]),
  T1 = erlang:system_time(millisecond),
  T2 = T1 - T0,
  io:format("Milliseconds: ~p~n", [ T2 ]),
  ok.


