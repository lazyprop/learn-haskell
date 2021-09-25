# Basics

## Function Application
The mathematical expression $f(a,b) + cd$ would translate in Haskell to:
```haskell
f a b + c*d
```

Function application in Haskell is denoted silently using spacing. The 'space'
operator (for function application) has higher precedence than all other
operators. So `f a + b` means `(f a) + b` and not `f (a + b)`

## Naming

The name of a functoin must begin with a lower-case letter but can be followed
by zero or more letters (upper or lowercase), digits, underscores, and single
forward quotes.

By convention, list arguments generally have the suffix `s` on their name. E.g a
list of numbers might be named `ns`, a list of arbitrary values might be named
`xs`, and a list of lists of chars might be named `css`.


# Types

Every expression has a type which is calculated prior to evaluating the
expression through a process of type inference.


## Curried Functions

In other languages, function arguments are passed as a tuple. In Haskell,
functions deal with arguments one at a time. They return a partially applied (or
curried) function.

The arrow `->` in type signatures is right associative. That is,
```haskell
Int -> Int -> Int -> Int
```
is the same as,
```haskell
Int -> (Int -> (Int -> Int))
```

Function application (denoted using space) is left associative.
```haskell
mult x y z
```
is the same as
```haskell
((mult x) y) z
```
Unless tupled, all functions are by default defined as curried functions.

Parenthisizing an operator turns it into a curried function like `(+)`
