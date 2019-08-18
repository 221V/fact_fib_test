# fact_fib_test
factorial fibonacci testing -- erlang, erlang to llvm, php 7, haskell

tests at:
(l)ubuntu 16.04.5 LTS
i3-2120 CPU @ 3.30GHz


## erlang

Erlang/OTP 22 [erts-10.4] [source] [64-bit] [smp:4:4] [ds:4:4:10] [async-threads:1] [hipe]
Eshell V10.4  (abort with ^G)

```
c(e0).

e0:test1(20000).
18192063202303451348276417568664587...
Milliseconds: 773 % 785, 780, 780, 763

e0:test2(20000).
18192063202303451348276417568664587...
Milliseconds: 808 % 822, 825, 831, 817

e0:test3(40).
102334155
Milliseconds: 4412 % 4405, 4537, 4384, 4619

e0:test4(40).
102334155
Milliseconds: 0

e0:test4(100).
354224848179261915075
Milliseconds: 0

e0:test4(20000).
253116232373236124224015500352060729...
Milliseconds: 20 % 17, 19, 18, 20
```


## erlang to_llvm

http://erllvm.softlab.ntua.gr/
c(test, [native, {hipe, [to_llvm]}]).
c(test), hipe:c(test, [to_llvm]).


```
c(e1, [native, {hipe, [to_llvm]}]).

e1:test1(20000).
18192063202303451348276417568664587...
Milliseconds: 755 % 749, 752, 770, 752

e1:test2(20000).
18192063202303451348276417568664587...
Milliseconds: 818 % 798, 804, 773, 719

e1:test3(40).
102334155
Milliseconds: 1047 % 1079, 1070, 1064, 1046

e1:test4(40).
102334155
Milliseconds: 0

e1:test4(100).
354224848179261915075
Milliseconds: 0

e0:test4(20000).
253116232373236124224015500352060729...
Milliseconds: 24 % 26, 25, 28, 23
```


## php 7

PHP 7.0.4-7ubuntu2 (cli) ( NTS )
Zend Engine v3.0.0, with Zend OPcache v7.0.6-dev

```
php -f e1.php n1=20000
18192063202303451348276417568664587...
Milliseconds: 148 // 146, 153, 145, 150

php -f e1.php n2=20000
18192063202303451348276417568664587...
Milliseconds: 108 // 103, 106, 107, 105

php -f e1.php n3=40
102334155
Milliseconds: 16955 // 16857, 16717, 17084, 16598

php -f e1.php n4=40
102334155
Milliseconds: 0

php -f e1.php n4=100
3.5422484817926E+20
Milliseconds: 0

php -f e1.php n4=20000
INF
Milliseconds: 2

php -f e1.php n5=100
354224848179261915075
Milliseconds: 0

php -f e1.php n5=20000
253116232373236124224015500352060729...
Milliseconds: 15 // 20, 15, 18, 19
```

## haskell

GHC version 8.6.3

```
stack build

./haskellfib "e1" 20000
18192063202303451348276417568664587...
Computation time: 0.068 sec -- 0.071, 0.069, 0.070, 0.069

./haskellfib "e2" 20000
18192063202303451348276417568664587...
Computation time: 0.069 sec -- 0.071, 0.069, 0.074, 0.065

./haskellfib "e3" 40
102334155
Computation time: 10.820 sec -- 10.816, 10.826, 10.802, 10.787

./haskellfib "e4" 40
102334155
Computation time: 0.000 sec

./haskellfib "e4" 100
354224848179261915075
Computation time: 0.000 sec

./haskellfib "e4" 20000
253116232373236124224015500352060729...
Computation time: 0.016 sec -- 0.016, 0.015, 0.017, 0.016
```



