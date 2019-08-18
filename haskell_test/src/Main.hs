module Main where

import             System.Environment        (getArgs)
import             System.IO.Unsafe          (unsafePerformIO)

--import             System.Time               (getClockTime, toCalendarTime, formatCalendarTime)
--import             System.Locale             (defaultTimeLocale)

import             Text.Printf
import             Control.Exception
import             System.CPUTime

{-
systime :: IO ()
systime = do
  ct <- getClockTime
  print ct -- print default format, or
  cal <- toCalendarTime ct
  putStrLn $ formatCalendarTime defaultTimeLocale "%a %b %e %H:%M:%S %Y" cal
-}

time :: IO t -> IO t
time a = do
  start <- getCPUTime
  v <- a
  end <- getCPUTime
  let diff = (fromIntegral (end - start)) / (10^12)
  printf "Computation time: %0.3f sec\n" (diff :: Double)
  return v


fact1 :: Integer -> Integer
fact1 0 = 1
fact1 n = n * fact1 (n - 1)

fact2 :: Integer -> Integer -> Integer
--fact2 n 1
fact2 0 a = a
fact2 n a = fact2 (n - 1) (n * a)

fib1 :: Integer -> Integer
fib1 0 = 0
fib1 1 = 1
fib1 n = fib1 (n - 1) + fib1 (n - 2)

fib2 :: Integer -> Integer -> Integer -> Integer
--fib2 n 0 1
fib2 0 f1 _ = f1
fib2 n f1 f2 = fib2 (n - 1) f2 (f1 + f2)


app_f_io :: String -> Integer -> IO ()
app_f_io "e1" n = putStrLn $ show $ fact1 n
app_f_io "e2" n = putStrLn $ show $ fact2 n 1
app_f_io "e3" n = putStrLn $ show $ fib1 n
app_f_io "e4" n = putStrLn $ show $ fib2 n 0 1


------------------------------------------------------------------------

test_route0 :: [String] -> IO String
test_route0 x
  | x == [] = putStrLn "args not found" >> return ""
  | otherwise = test_route (head x) (tail x)


test_route :: String -> [String] -> IO String
test_route _ [] = putStrLn "args not found" >> return ""
test_route "e1" (n0:[]) = do
  let n = read n0 :: Integer
  --systime
  --time $ product [1..10000] `seq` return ""
  time $ app_f_io "e1" n 
  return ""
test_route "e2" (n0:[]) = do
  let n = read n0 :: Integer
  time $ app_f_io "e2" n 
  return ""
test_route "e3" (n0:[]) = do
  let n = read n0 :: Integer
  time $ app_f_io "e3" n 
  return ""
test_route "e4" (n0:[]) = do
  let n = read n0 :: Integer
  time $ app_f_io "e4" n 
  return ""
test_route _ _ = putStrLn "args not found" >> return ""


main :: IO String
main = do
  test_route0 $ unsafePerformIO getArgs


