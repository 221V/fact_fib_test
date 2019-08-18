<?php

parse_str(implode('&', array_slice($argv, 1)), $_GET);

$startTime = microtime();

// factorial
if(isset($_GET['n1'])){
  $r1 = gmp_init("1", 10);
  $i2 = gmp_init("1", 10);
  $i3 = gmp_init($_GET['n1'], 10);
  for($i = gmp_init("1", 10); (gmp_cmp($i, $i3) == -1) || (gmp_cmp($i, $i3) == 0); $i = gmp_add($i, $i2)){
    $r1 = gmp_mul($r1, $i);
  }
  echo $r1;
  echo "\n";
}

if(isset($_GET['n2'])){
  $r1 = gmp_fact($_GET['n2']);
  echo $r1;
  echo "\n";
}

// fibonacci
if(isset($_GET['n3'])){
  function fib($n){if($n <= 1){return $n;}else{return (fib($n - 1) + fib($n - 2));}}
  $r1 = fib($_GET['n3']);
  echo $r1;
  echo "\n";
}

if(isset($_GET['n4'])){
  $r1 = 1;
  $i2 = 1;
  for($i = 3;$i <= $_GET['n4'];$i++){
    $c = $i2 + $r1;
    $i2 = $r1;
    $r1 = $c;
  }
  echo $r1;
  echo "\n";
}

if(isset($_GET['n5'])){
  $r1 = gmp_init("1", 10);
  $i1 = gmp_init("1", 10);
  $i2 = gmp_init("1", 10);
  $i3 = gmp_init($_GET['n5'], 10);
  for($i = gmp_init("3", 10); (gmp_cmp($i, $i3) == -1) || (gmp_cmp($i, $i3) == 0); $i = gmp_add($i, $i1)){
    $c = gmp_add($i2, $r1);
    $i2 = $r1;
    $r1 = $c;
  }
  echo $r1;
  echo "\n";
}


$endTime = microtime();
$diff = 
// seconds diff to milliseconds
(intval((explode(" ", $endTime))[1]) - 
intval((explode(" ", $startTime))[1])) * 1000 + 
// add milliseconds diff
round(floatval((explode(" ", $endTime))[0]) * 1000 - 
floatval((explode(" ", $startTime))[0]) * 1000);

echo 'Milliseconds: ';
echo $diff;
echo "\n";

/*
echo $startTime;
echo "\n";
echo $endTime;
echo "\n";
// 0.15867400 1566095373
// 0.68819100 1566095380
*/

