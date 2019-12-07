# Chapter 1

## Commands ghci

- `:load` - load files .hs
- `:realod` - reload files
- `:quit` - quit REPL
- `:cd` -  change of directory
- `:type` - check the type of any expression


## Comments

Single line `--`
Multilinea `{-   -}`

## where keyword

Useful to declarate intermediate results that are local to the function. The *where* and
the local definitions are indented by 4 spaces.
Example: Heron's formula

```
heron a b c = sqrt (s * (s - a) * (s - b) * (s - c))
    where
    s = (a + b + c) / 2
```

## Sumary

1. Variables store values (which can be any arbitrary Haskell expression).
2. Variables do not change within a scope.
3. Functions help you write reusable code.
4. Functions can accept more than one parameter.


## Exercises

```
double x = 2 * x
quadruple x = double (double x)
square x = x * x
half x = x / 2
```

Explain how works quadruple 5:

```
Replace quadruple 5 by double (double 5)
Then double (double 5) by double (2 * 5)
Then double (2 * 5) by 2 * (2 * 5)
Then 2 * 10
Then 20
```

Define a function that substract 12 from half its argument

```
substract12 x = half x - 12
```

Write a function to calculate the volume of a box

```
volume h w l = h * w * l
```

# Chapter 2


## Types

The symbol `::` can be read as simply *is of type*. For example `:type True` returns `True :: Bool`, so we can
read it as *True is of type Bool*.

- `Bool` - booleans (`True`, `False`)
- `Char` - literal characteres are entered by enclosing them with single quotation marks (`:type 'H'` returns `H :: Char`)
- `String or [Char]` - string of characters, we use double quotation marks instead (`:type "Hello world"` returns `"Hello world" :: [Char]`)


Function have type as well, some examples, check the functions `not`, `chr` and `ord`

```
:t not
not :: Bool -> Bool

:t chr
chr :: Int -> Char

:t ord
ord :: Char -> Int
```

Note: `chr` and `ord` are not availables by default, we need load the `Data.Char` module using `:module Data.Char`.

## Types signatures in code

Type signatures are used for annotating functions in source files. For clarity, type signatures go above
the corresponding function definition. Example:

```
xor :: Bool -> Bool -> Bool
xor p q = (p || q) && not (p && q)
```

## Guards

```
absolute x
    | x < 0 = -x
    | otherwise = x
```

## Exercises

What are the types of the following functions?

1. The negate function `negate x = -x`.
2. The `(||)` function, pronunced *or*, that takes two Bools and returns a third Bool which is True if either
  of the arguments were, and False otherwise.
3. `f x y = not x && y`.
4. `g x = (2*x - 1)^2`.

Solutions:
1. `negate :: Int -> Int`
2. `(||) :: Bool -> Bool -> Bool`
3. `f :: Bool -> Bool -> Bool`
4. `g :: Int -> Int`


# Chapter 3

## Lists

The elements of a list must have the same types.

```
let numbers = [1,2,3,4]
let truths = [True, Flase, True]
let strings = ["Hello", "all", "the", "world"]
```

And also we can use the operator `(:)` to prepend items.

```
Prelude> let numbers = [1,2,3,4]
Prelude> 0:[1,2,3,4]
[0,1,2,3,4]
Prelude 2:2:1:0:numbers
[2,2,1,0,1,2,3,4]
```

Strings are just lists

```
Prelude> "hey" == ['h', 'e', 'y']
True
```

List of lists

```
let listOfLists = [[1,2], [3,4], [5,6]]
```

## Tuples

- Fixed number of elements (immutable)
- The elements of a tuple do not need to be all of the same type.

Examples:

```
(True, 1)
("Hello world", False)
(4, 5, "Six", True, 'b', [1,2,3])
```

We can build list of tuples and tuples with lists. Examples:

```
[(1,2), (3,4), (5,6)]
([1,2], [True, False], "Hello world")
([1,2], [True, False], "Hello world", False)
```

Retrieving values

For a 2-tuple

- `fst`: first element of a tuple
- `snd`: retrieve the second element of a tuple

```
Prelude> fst (1, True)
1
Prelude> snd (1, True)
True

Prelude> :t fst
fst :: (a, b) -> a
Prelude> :t snd
snd :: (a, b) -> b
```


For lists, the functions `head` and `tail` are analogous to `fst` and `snd`. `head`
evaluates to the first element of the list and `tail` gives the rest of the list.

```
Prelude> head [1,2,3,4]
1
Prelude> tail [1,2,3,4]
[2,3,4]

Prelude> :t head
head :: [a] -> a
Prelude> :t tail
tail :: [a] -> [a]
```

## Summary

1. List are defined by square brakets and commas: `[1,2,3]`.
  - List can contain anything as long as all elements of the list are of the same type.
  - List can also be build by the cons operator `(:)`, but you can only cons things onto list.
2. Tuples are defined by parentheses and commas: `(1, True, "Hello")`.
  - Tuples can contain anything, even things of different types.
  - The length of a tuple is encoded in its type; tuples with different lengths will have different types.
3. List and tuples can be combined in any number of ways.

## Exercices

