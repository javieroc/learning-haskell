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


## Numeric types

*Num* is a **typeclass** - a group of types which includes all types which are regarded as numbers.
The `(Num a) =>` part of the signature restricts `a` to numbers types.

**Numeric types:**

- Int
- Integer
- Double
- Float

**Typeclasses:**

- Num
- Fractional
- Integral


Note: in some cases we're going to need change from a monomorphic type to a polymorphic type.
Example of this is, if we try to do a `(/)` between a *Num* with a *Int*, so we should use in this case
a function like `fromIntegral` to convert an *Integral* into a polymorphic value.

```
Prelude> 4 / fromIntegral (length [1,2,3])
1.3333333333333333
```

Polymorphics functions: `(+)`, `(/)`, `(==)`.
`(==)` compares two values of the same type, which must belong to the class `Eq`.


## Exercices

Problems

1. Would the following piece of Haskell work: `3:[True, False]`.
2. Write a function `cons8` that takes a list as an argument and conses `8` at the beginning on to it.
3. Adapt the above function in a way that `8` is at the end of the list.
4. Write a function that takes two arguments a list and a thing, and conses the thing on to the list.

Solutions

1. Not. Because we should conses things onto a list with the same type.

```
cons8 :: (Num a) => [a] -> [a]
cons8 l = 8:l

cons8end :: (Num a) => [a] -> [a]
cons8end l = l ++ [8]

consThing :: [a] -> a -> [a]
consThing list thing = thing:list
```

Problems

1. Which of these are valid Haskell and which are not? Rewrite in cons notation.
  a. `[1,2,3,[]]`
  b. `[1,[2,3],4]`
  c. `[[1,2,3],[]]`
2. Which of these are valid Haskell, and which are not? Rewrite in comma and bracket notation.
  a. `[]:[[1,2,3],[4,5,6]]`
  b. `[]:[]`
  c. `[]:[]:[]`
  d. `[1]:[]:[]`
  c. `["hi"]:[1]:[]`
3. Can Haskell have lists of lists of lists? Why or why not?
4. Why is the following list invalid in Haskell?
  - `[[1,2],3,[4,5]]`

Solutions

1. Just the third one is valid. Cons notation `[1,2,3]:[[]]` or `[1,2,3]:[]:[]`
2. Results:
  a. `[[],[1,2,3],[4,5,6]]`
  b. `[[]]`
  c. `[[],[]]`
  d. `[[1],[]]`
  e. Invalid because we can't have a list with different types inside.
3. Yep `[[[1,2], [3,4], [5,6]],[[7,8], [9, 10]]]` because it's just `[[[a]]]` type.
4. It's invalid because we can not have a mixed types into a list, in this case we have a list of numbers and a single number.


Problems

1. Write down the 3-tuple whose first element is 4, second element is "hello" and third element is True.
2. Which of the following are valid tuples?
  a. `(4, 4)`
  b. `(4, "hello")`
  c. `(True, "Blah", "foo")`
  d. `()`
3. Lists can be built by consing new elements onto them. Cons a number onto a list of numbers, you will get back a list of numbers.
  There is no such way to build up tuples.
  a. Why do you think that is?
  b. For the sake of argument, say that there was such a function. What would you get if you "consed" something on a tuple?

Solutions

1. `(4, "hello", True)`.
2. results:
  a. valid
  b. valid
  c. valid
  d. weird but valid
3. ?

Problems

Which of these are valid Haskell, and why?
  1. `1:(2,3)`
  2. `(2,4):(2,3)`
  3. `(2,4):[]`
  4. `[(2,4),(5,5),('a','b')]`
  5. `([2,4],[2,2])`

Solutions

1. Not valid. You can't cons elements onto a tuple.
2. Not valid. Cons operator `(:)` need a list as second argument.
3. Valid.
4. Not valid. You can't have a list of tuples with different signature.
5. Valid.

Problems

1. Use a combination of fst and snd to extract the 4 from the tuple `(("Hello", 4), True)`.
2. Normal chess notation is somewhat different to ours: it numbers the rows from 1-8 and the columns a-h; and the column label is customarily given first. Could we label a specific point with a character and a number, like ('a', 4)? What important difference with lists does this illustrate?
3. Write a function which returns the head and the tail of a list as the first and second elements of a tuple.
4. Use head and tail to write a function which gives the fifth element of a list. Then, make a critique of it, pointing out any annoyances and pitfalls you notice.

Solutions

1. `snd (fst (("Hello", 4), True))`.
2. If we use list we can't use differet types into them, like Char and Num.
3. `headTail list = (head list, tail list)`
4. `fifthElement list = head (tail (tail (tail (tail list))))`

Problems

Give type signatures for the following functions:

1. The solution to the third exercise of the previous section ("... a function which returns the head and the tail of a list as the first and second elements of a tuple").
2. The solution to the fourth exercise of the previous section ("... a function which gives the fifth element of a list").
3. h x y z = chr (x - 2) (remember we discussed chr in the previous chapter).

Solutions

1. `headTail :: [a] -> (a, [a])`
2. `fifthElement :: [a] -> a`
3. `h :: Int -> p1 -> p2 -> Char`


# Chapter 4

## Conditional expressions *if...then...else*

Example:

```
mySignum x =
    if x < 0
        then -1
        else if x > 0
            then 1
            else 0
```

Haskell always requires both then and an else clauses. The expression returned in each case
*then/else* must be a value of the same type.

Functions defined with `if / then / else` could be defined using guards as well.

Example:

```
mySignumGuards x
    | x < 0 -1
    | x > 0 1
    | otherwise 0
```

## Introducing patter matching

Example:

```
pts :: Int -> Int
pts 1 = 10
pts 2 = 6
pts 3 = 4
pts 4 = 3
pts 5 = 2
pts 6 = 1
pts _ = 0
```

This feature of haskell is called pattern matching.
When we call `pts`, the argument is matched againts the numbers on the left side of the equations.
The matching is done in order we wrote the equations.

**Tuple and list patterns**

Examples:

```
fst' :: (a, b) -> a
fst' (x, _) = x

snd' :: (a, b) -> b
snd' (_, x) = x

head :: [a] -> a
head (x:_) = x
head [] = error "Prelude.head: empty list"

tail :: [a] -> [a]
tail (_:xs) = xs
tail [] = error "Prelude.head: empty list"
```

## Let bindings

Example of use `let / in`

```
root a b c =
    ((-b + sqrt(b * b - 4 * a * c)) / (2 * a),
    (-b - sqrt(b * b - 4 * a * c)) / (2 * a))

root a b c =
    let sdisc = sqrt(b * b - 4 * a * c)
        twice_a = 2 * a
    in ((-b + sdisc) / twice_a, (-b - sdisc) / twice_a)
```

