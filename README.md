# Chapter 1

## Commands ghci

- `:load` - load files .hs
- `:realod` - reload files
- `:quit` - quit REPL
- `:cd` -  change of directory


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

## Exercises

```
double x = 2 * x
quadruple x = double (double x)
square x = x * x
half x = x / 2
```

### Explain how works quadruple 5:

```
Replace quadruple 5 by double (double 5)
Then double (double 5) by double (2 * 5)
Then double (2 * 5) by 2 * (2 * 5)
Then 2 * 10
Then 20
```

### Define a function that substract 12 from half its argument

```
substract12 x = half x - 12
```

## Write a function to calculate the volume of a box

```
volume h w l = h * w * l
```

## Sumary

1. Variables store values (which can be any arbitrary Haskell expression).
2. Variables do not change within a scope.
3. Functions help you write reusable code.
4. Functions can accept more than one parameter.
