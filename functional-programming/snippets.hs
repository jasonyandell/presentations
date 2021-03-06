{-- Type inference --}

let f a b = a^2 + b^2

let g a b = sqrt (a^2 + b^2)

let h a b = sqrt $ a^2 + b^2

:type flip (^) 2

let square = flip (^) 2

let norm = sqrt . fromIntegral . sum . map square

--\

{-- Pattern matching --}

fib 0 = 0
fib 1 = 1
fib n = fib (n-2) + fib (n-1)

--\

{-- Algebraic datatypes --}

data Color = 
      Red
    | Yellow
    | Blue

data Tree a = Node a (Tree a) (Tree a)
            | Empty
            deriving (Show)
--\

{-- Function composition --}

let f = sqrt . sum

--\

{-- Anonymous functions --}

let cubes = map (\n -> n * n * n)
let adder n = \m -> n + m
let add37 = adder 37
add37 42

--\

{-- Partial application --}

let timesPi = (*) 3

--\

{-- List Comprehensions --}

[ (a,b,c) | a <- [1..25], b <- [a..25], c <- [b..25], a^2 + b^2 == c^2 ]

--\

{-- Higher order functions --}

map (\x -> x * x ) [1..10]
:type flip

--\

{-- Tail recursion --}

fact n = 
    factaux 1 acc = acc
        factaux i acc = fact (i-1) (i*acc)
    in factaux n 1

--\

{-- Monads --}

import qualified Data.Map as M

getAddress person phoneMap carrierMap addressMap = 
        lookup phoneMap person >>= lookup carrierMap >>= lookup addressMap
    where lookup = flip M.lookup

instance Monad Maybe where
    Just x >>= k = k x
    Nothing >>= _ = Nothing

    return x = Just x

    Just _ >> k = k
    Nothing >> _ = Nothing 
    fail _ = Nothing
